# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Project < ApplicationRecord
  validates :name, presence: true, length: { minimum: 4 }

  has_many :activities
  has_many :sprints
  # has_many :roles
  has_many :user_projects
  has_many :users, through: :user_projects
end
