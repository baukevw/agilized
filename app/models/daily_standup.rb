class DailyStandup < ApplicationRecord
  belongs_to :sprint
  has_many :activities
end
