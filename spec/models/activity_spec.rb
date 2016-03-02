# == Schema Information
#
# Table name: activities
#
#  id         :integer          not null, primary key
#  yesterday  :string
#  today      :string
#  problems   :string
#  user_id    :integer
#  project_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  sprint_id  :integer
#

require 'rails_helper'

RSpec.describe Activity, type: :model do
  describe 'validations' do
    it { should validate_presence_of :yesterday }
    it { should validate_length_of(:yesterday).is_at_least(4).on(:create) }

    it { should validate_presence_of :today }
    it { should validate_length_of(:today).is_at_least(4).on(:create) }

    it { should validate_presence_of :problems }
    it { should validate_length_of(:problems).is_at_least(4).on(:create) }

    # The Activity model has relations.
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :project_id }
    it { should validate_presence_of :sprint_id }
  end

  describe 'relations' do
    # it { should belong_to :user }
    it { should belong_to :project }
    it { should belong_to :sprint }
  end

end
