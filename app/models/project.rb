# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Project < ApplicationRecord
  has_many :team_in_projects
  has_many :teams, through: :team_in_projects

  accepts_nested_attributes_for :teams
end
