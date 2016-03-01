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
#

class Sprint < ApplicationRecord
  belongs_to :project
  has_many :activities
end
