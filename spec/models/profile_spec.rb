require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end

  describe 'table' do
    it { is_expected.to have_db_index(:email).unique(true) }
  end
end
