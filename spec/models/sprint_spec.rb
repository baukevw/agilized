require 'rails_helper'

RSpec.describe Sprint, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_length_of(:title).is_at_least(4).on(:create) }

    it { should validate_presence_of :start_date }
    it { should validate_presence_of :end_date }
  end

  describe 'relations' do
    it { should belong_to :project }
    it { should have_many :activities }
  end

end
