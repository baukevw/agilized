require 'ffaker'

FactoryGirl.define do
  factory :project do
    name { Faker::Product.product }
  end
end


