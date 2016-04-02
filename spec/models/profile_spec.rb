require 'rails_helper'

RSpec.describe Profile, type: :model do
  subject { build(:profile) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_presence_of(:profession) }
    it do
      is_expected.to validate_numericality_of(:age).is_greater_than(0)
        .only_integer
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:state) }
    it { is_expected.to have_many(:saved_queries).dependent(:destroy) }
  end

  describe 'table' do
    it { is_expected.to have_db_index(:email).unique(true) }
  end
end
