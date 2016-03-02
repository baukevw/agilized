require 'rails_helper'

RSpec.describe UserProject, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:project).on(:update) }
    it { should validate_presence_of(:user).on(:update) }
    # it { should validate_presence_of :role }
  end

  describe 'relations' do
    it { should belong_to :project }
    it { should belong_to :user }
    it { should have_one(:role).with_foreign_key('user_project_id') }
  end

end
