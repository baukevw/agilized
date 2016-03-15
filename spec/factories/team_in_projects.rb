# == Schema Information
#
# Table name: team_in_projects
#
#  id         :integer          not null, primary key
#  team_id    :integer
#  project_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :team_in_project do
    team_id 1
    project_id 1
  end
end
