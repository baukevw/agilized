# == Schema Information
#
# Table name: daily_standups
#
#  id          :integer          not null, primary key
#  date        :datetime
#  description :text
#  sprint_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe DailyStandup, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
