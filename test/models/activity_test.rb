# == Schema Information
#
# Table name: activities
#
#  id               :integer          not null, primary key
#  yesterday        :text
#  today            :text
#  problems         :text
#  late             :boolean
#  late_reason      :text
#  absence          :boolean
#  absence_reason   :text
#  daily_standup_id :integer
#  user_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
