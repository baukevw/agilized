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

require 'rails_helper'

RSpec.describe TeamInProject, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
