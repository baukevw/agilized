# == Schema Information
#
# Table name: sprints
#
#  id         :integer          not null, primary key
#  title      :string
#  start_date :date
#  end_date   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :integer
#

class Sprint < ApplicationRecord
  validates :title, presence: true, length: { minimum: 4 }
  validates :start_date, presence: true
  validates :end_date, presence: true

  belongs_to :project
  has_many :activities
end
