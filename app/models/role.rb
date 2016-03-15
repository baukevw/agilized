# == Schema Information
#
# Table name: roles
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Role < ApplicationRecord
  has_many :user_in_teams
  has_many :teams, through: :user_in_teams
  has_many :users, through: :user_in_teams
end
