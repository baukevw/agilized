class Role < ApplicationRecord
  has_many :user_in_teams
  has_many :teams, through: :user_in_teams
end
