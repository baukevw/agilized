FactoryGirl.define do
  factory :sprint do
    title { Faker::Company.name }
    start_date { Faker::Date.between(7.days.ago, 4.days.ago) }
    end_date { Faker::Date.backward(1) }
  end
end
