require 'rails_helper'

RSpec.describe SavedQuery, type: :model do
  subject { build(:saved_query) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:parameters) }
    it do
      is_expected.to validate_uniqueness_of(:name).scoped_to(:profile_id)
        .case_insensitive
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:profile) }
  end

  describe 'serializers' do
    it { is_expected.to serialize(:parameters).as(JSON) }
  end

  describe 'table' do
    it { is_expected.to have_db_index([:profile_id, :name]).unique(:true) }
  end
end
