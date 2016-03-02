require 'rails_helper'

RSpec.feature 'Projects', type: :feature do
  let!(:user) { create(:user) }
  let!(:project) { create(:project, users: [user]) }
  context 'Index page' do
    before :each do
      login_as user
      visit root_path
    end

    it 'shows collaboration in all projects' do
      expect(page).to have_content project.name
    end

    it 'should contain the new project link' do
      expect(page).to have_link('New project')
    end

    it 'can click on the new project link' do
      within('body') do
        click_link 'New project'
      end
      expect(current_path).to eq(new_project_path)
    end

    it 'should have a Project show link' do
      click_link I18n.t('project.show')
    end

    it 'should have a Destroy link' do
      expect(page).to have_content I18n.t('project.destroy')
    end
  end
  context 'New page' do
    before do
      visit new_project_path
    end

    it 'shows a form' do
      expect(page).to have_css('input[type="text"]')
    end

    it 'should have a save project button' do
      expect(page).to have_button 'Create project'
    end

    it 'can proces the form' do
      expect do
        within('body') do
          fill_in 'project_name', with: Faker::Company.name
        end
        click_button 'Create project'
      end .to change(Project.all, :count).by(1)
      expect(current_path).to eq(project_path(Project.last))
    end

    it 'validates the form' do
      within('body') do
        fill_in 'project_name', with: Faker::Company.name
      end
      click_button 'Create project'
      expect(current_path).to eq(project_path(Project.last))
      expect(page).to have_content(Project.last.name)
    end

    context 'edit page' do
      before do
        visit edit_project_path(project)
      end

      it 'can edit the form' do
        within('body') do
          fill_in 'project_name', with: Faker::Name.name
        end
        click_button 'Update project'
        expect(current_path).to eq(project_path(Project.last))
      end

      it 'validates the form' do
        within('body') do
          fill_in 'project_name', with: 'sho'
        end
        click_button 'Update project'
        expect(current_path).to eq(project_path(project))
        expect(page).to have_content 'Name'
      end
    end

    context 'delete an project' do
      it 'deletes an project' do
        visit projects_path
        before = Project.all.count
        click_link 'Remove the fucking project'
        expect(Project.all.count).to be < before
      end
    end
  end
end
