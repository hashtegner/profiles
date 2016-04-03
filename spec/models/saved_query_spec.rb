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

  describe 'table' do
    it { is_expected.to have_db_index([:profile_id, :name]).unique(:true) }
  end

  describe '#safe_parameters' do
    context 'with malicious parameters' do
      before { subject.parameters = 'javascript: alert(1)' }

      it do
        expect(subject.safe_parameters).to eql('javascript: alert(1)' => nil)
      end
    end

    context 'with empty parameters' do
      before { subject.parameters = '' }

      it { expect(subject.safe_parameters).to be_empty }
    end

    context 'with valid parameters' do
      before { subject.parameters = 'foo=hello&bar=world' }

      it do
        expect(subject.safe_parameters).to eql('foo' => 'hello',
                                               'bar' => 'world')
      end
    end
  end
end
