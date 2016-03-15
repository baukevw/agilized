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

require 'rails_helper'

RSpec.describe Sprint, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
