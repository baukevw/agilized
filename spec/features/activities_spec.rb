require 'rails_helper'

RSpec.feature 'Activities', type: :feature do
  let!(:user) { create(:user) }
  let!(:project) { create(:project, user_id: user.id) }
  let!(:sprint) { create(:sprint, project_id: project.id) }
  let!(:activity) { create(:activity, user_id: user.id, project_id: project.id, sprint_id: sprint.id) }
  context 'Index page' do
    before :each do
      login_as user
      visit project_activities_path(project)
    end

    it 'should show all the correct activities for the current project' do
      @project.should have.project_id(:project)
    end

    it 'shows the current project with activities' do
      expect(page).to have_content project.name
    end


  end
end
