FactoryGirl.define do
  factory :activity do
    yesterday { Faker::Lorem.words(4) }
    today { Faker::Lorem.words(4) }
    problems { Faker::Lorem.words(4) }
    date { Faker::Date.between(2.days.ago, Date.today) }

    user
    project
    sprint
  end
end

