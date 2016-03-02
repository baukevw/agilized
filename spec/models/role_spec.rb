# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Role, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_length_of(:name).is_at_least(4).on(:create) }
  end

  describe 'relations' do
    it { should belong_to(:user_project).with_foreign_key('user_project_id')  }
  end

end


