class Activity < ApplicationRecord
  belongs_to :sprint
  belongs_to :project
end
