# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Team < ApplicationRecord
  has_many :team_in_projects
  has_many :projects, through: :team_in_projects
  has_many :user_in_teams
  has_many :roles, through: :user_in_teams
  has_many :users, through: :user_in_teams

  accepts_nested_attributes_for :roles
end
