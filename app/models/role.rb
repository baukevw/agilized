# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Role < ApplicationRecord
  validates :name, presence: true, length: { minimum: 4 }
  belongs_to :user_project, foreign_key: 'user_project_id'
end


