# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_length_of(:name).is_at_least(4).on(:create) }
  end

  describe 'relations' do
    it { should have_many :activities }
    it { should have_many :sprints }
    it { should have_many(:users).through(:user_projects) }
  end

end
