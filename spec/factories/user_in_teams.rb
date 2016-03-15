# == Schema Information
#
# Table name: user_in_teams
#
#  id         :integer          not null, primary key
#  role_id    :integer
#  user_id    :integer
#  team_id    :integer
#  admin      :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :user_in_team do
    role_id 1
    user_id 1
    team_id 1
    admin false
  end
end
