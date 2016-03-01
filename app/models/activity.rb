# == Schema Information
#
# Table name: activities
#
#  id         :integer          not null, primary key
#  yesterday  :string
#  today      :string
#  problems   :string
#  user_id    :integer
#  project_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  sprint_id  :integer
#

class Activity < ApplicationRecord
  validates :yesterday, presence: true, length: { minimum: 4 }
  validates :today, presence: true, length: { minimum: 4 }
  validates :problems, presence: true, length: { minimum: 4 }

  validates :user_id, presence: true
  validates :project_id, presence: true
  validates :sprint_id, presence: true

  belongs_to :sprint
  belongs_to :project
end
