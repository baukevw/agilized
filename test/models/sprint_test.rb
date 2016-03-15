# == Schema Information
#
# Table name: sprints
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  start_date  :datetime
#  end_date    :datetime
#  team_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class SprintTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
