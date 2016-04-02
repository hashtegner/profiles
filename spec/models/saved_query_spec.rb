require 'rails_helper'

RSpec.describe SavedQuery, type: :model do
  subject { build(:saved_query) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it do
      is_expected.to validate_uniqueness_of(:name).scoped_to(:profile_id)
        .case_insensitive
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:profile) }
  end

  describe 'table' do
    it { is_expected.to have_db_index([:profile_id, :name]).unique(:true) }
    it { is_expected.to have_db_index(:parameters) }
  end
end
