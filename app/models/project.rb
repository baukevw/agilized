class Project < ApplicationRecord
  has_many :activities
  has_many :sprints
  has_many :roles
  # has_many :users, through: :user_projects
end
