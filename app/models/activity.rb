class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :daily_standup
end
