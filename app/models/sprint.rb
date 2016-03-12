class Sprint < ApplicationRecord
  belongs_to :team
  has_many :daily_standups
end
