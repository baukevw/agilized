FactoryGirl.define do
  factory :user do
    email "info@etore.nl"
    password "kevinetore"
    password_confirmation "kevinetore"
    confirmed_at Time.zone.yesterday
  end
end
