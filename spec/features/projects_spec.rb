require 'rails_helper'

RSpec.feature 'Projects', type: :feature do
  let!(:project) { create(:project) }
  context 'Index page' do
    before do
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
          fill_in 'name', with: Faker::Name.name
        end
        click_button 'Create project'
      end .to change(Project.all, :count).by(1)
      expect(current_path).to eq(project_path(Project.last))
    end

    it 'validates the form' do
      within('body') do
        fill_in 'name', with: 'sho'
      end
      click_button 'Create project'
      expect(current_path).to eq(project_path)
      expect(page).to have_content 'Name is too short'
    end

    context 'edit page' do
      before do
        visit edit_project_path(project)
      end
      it 'can edit the form' do
        within('body') do
          fill_in 'name', with: Faker::Name.name
        end
        click_button 'Update project'
        expect(current_path).to eq(project_path(Project.last))
      end
      it 'validates the form' do
        within('body') do
          fill_in 'name', with: 'sho'
        end
        click_button 'Update project'
        expect(current_path).to eq(project_path(project))
        expect(page).to have_content 'Name is too short'
      end
    end
    context 'delete an project' do
      before do
        visit project_path
      end
      it 'deletes an project' do
        before = Project.all.count
        click_link 'Destory'
        expect(Project.all.count).to be < before
      end
    end
  end
end
