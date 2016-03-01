# == Schema Information
#
# Table name: user_projects
#
#  id         :integer          not null, primary key
#  project_id :integer
#  user_id    :integer
#  role_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserProject < ApplicationRecord
  validates :project_id, presence: true
  validates :user_id, presence: true
  validates :role_id, presence: true

  belongs_to :project
  belongs_to :user
  has_one :role, foreign_key: 'user_project_id'
end
