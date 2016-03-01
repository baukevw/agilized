FactoryGirl.define do
  factory :activity do
    yesterday { Faker::Lorem.words(4) }
    today { Faker::Lorem.words(4) }
    problems { Faker::Lorem.Lorem.words(4) }
    user_id 1
    project_id 1
    sprint_id 1
  end
end

