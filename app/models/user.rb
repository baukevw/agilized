class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :identities
  accepts_nested_attributes_for :identities
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :github]

  has_many :user_projects
  has_many :projects, through: :user_projects
  has_many :activities

  def self.from_omniauth(auth)
    identity = all.joins(:identities).where(identities: { provider: auth.provider, uid: auth.uid}).first
    if identity.nil?
      user = find_by_email(auth.info.email)
      if user.nil?
        pass = Devise.friendly_token[0,20]
        u = create(identities_attributes: [{ provider: auth.provider,
                                             uid: auth.uid }], email: auth.info.email,
                   password: pass, confirmed_at: Time.zone.now)
        u
      else
        User.where(email: auth.info.email).first
      end
    # where(identity: { provider: auth.provider,
    #              uid: auth.uid }).first_or_create do |new_user|
    #   new_user.email = auth.info.email
    #   new_user.password = Devise.friendly_token[0, 20]
    #   new_user.confirm
    else
      identity
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if (data = session['devise.facebook_data']) &&
          session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email'] unless user.email?
      end
    end
  end
end
