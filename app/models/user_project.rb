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
  validates :project, presence: true, on: :update
  validates :user, presence: true, on: :update
  # validates :role, presence: true, on: :update

  belongs_to :project, optional: true
  belongs_to :user, optional: true
  has_one :role, foreign_key: 'user_project_id'
end
