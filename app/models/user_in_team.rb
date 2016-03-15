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

class UserInTeam < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :team
  belongs_to :role
end
