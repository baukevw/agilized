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

FactoryGirl.define do
  factory :activity do
    yesterday "MyText"
    today "MyText"
    problems "MyText"
    late false
    late_reason "MyText"
    absence false
    absence_reason "MyText"
    daily_standup_id 1
    user_id 1
  end
end
