class UserInTeam < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :team
  belongs_to :role
end
