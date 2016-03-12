FactoryGirl.define do
  factory :user_in_team do
    role_id 1
    user_id 1
    team_id 1
    admin false
  end
end
