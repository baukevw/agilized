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

class DailyStandup < ApplicationRecord
  belongs_to :sprint
  has_many :activities
end
