# == Schema Information
#
# Table name: identities
#
#  id         :integer          not null, primary key
#  uid        :string
#  provider   :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Identity < ApplicationRecord
  belongs_to :user, optional: true
  validates :uid, presence: true
  validates :provider, presence: true
end
