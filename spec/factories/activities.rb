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
