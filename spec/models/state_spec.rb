require 'rails_helper'

RSpec.describe State, type: :model do
  subject { build(:state) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  end

  describe 'table' do
    it { is_expected.to have_db_index(:name).unique(:true) }
  end
end
