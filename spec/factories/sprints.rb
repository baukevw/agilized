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

FactoryGirl.define do
  factory :sprint do
    title "MyString"
    description "MyText"
    start_date "2016-03-12 23:17:02"
    end_date "2016-03-12 23:17:02"
    team_id 1
  end
end
