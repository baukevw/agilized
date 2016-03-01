FactoryGirl.define do
  factory :sprint do
    title { Faker::Product.brand }
    start_date { Faker::Date.between(7.days.ago, Date.yesterday) }
    end_state { Faker::Date.today }
  end
end
