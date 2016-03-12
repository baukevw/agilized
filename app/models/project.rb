class Project < ApplicationRecord
  has_many :team_in_projects
  has_many :teams, through: :team_in_projects
end
