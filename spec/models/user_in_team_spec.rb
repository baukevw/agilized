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

require 'rails_helper'

RSpec.describe UserInTeam, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
