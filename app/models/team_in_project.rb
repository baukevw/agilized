# == Schema Information
#
# Table name: team_in_projects
#
#  id         :integer          not null, primary key
#  team_id    :integer
#  project_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TeamInProject < ApplicationRecord
  belongs_to :team
  belongs_to :project
end
