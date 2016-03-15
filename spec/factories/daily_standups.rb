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

FactoryGirl.define do
  factory :daily_standup do
    date "2016-03-12 23:18:19"
    description "MyText"
    sprint_id 1
  end
end
