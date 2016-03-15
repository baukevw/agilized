# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string
#  photo                  :string
#  uid                    :string
#  provider               :string
#  oauth                  :boolean
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :github]

  has_many :identities
  has_many :activities
  has_many :user_in_teams
  has_many :teams, through: :user_in_teams
  has_many :roles, through: :user_in_teams
  accepts_nested_attributes_for :identities

  validates :identities, presence: true, if: proc { oauth == true }


  def self.from_omniauth(auth)
    identity = all.joins(:identities).where(identities: { provider: auth.provider, uid: auth.uid}).first
    if identity.nil?
      user = find_by_email(auth.info.email)
      if user.nil?
        pass = Devise.friendly_token[0,20]
        u = create(identities_attributes: [{ provider: auth.provider,
                                             uid: auth.uid }], email: auth.info.email,
                   password: pass, confirmed_at: Time.zone.now, oauth: true)
        u
      else
        u = User.where(email: auth.info.email).first
        Identity.create!(uid: auth.uid, provider: auth.provider, user: u)
        return u
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
end
