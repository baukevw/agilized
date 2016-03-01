# == Schema Information
#
# Table name: activities
#
#  id         :integer          not null, primary key
#  yesterday  :string
#  today      :string
#  problems   :string
#  user_id    :integer
#  project_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  sprint_id  :integer
#

require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
