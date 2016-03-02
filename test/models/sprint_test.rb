# == Schema Information
#
# Table name: sprints
#
#  id         :integer          not null, primary key
#  title      :string
#  start_date :date
#  end_date   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :integer
#

require 'test_helper'

class SprintTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
