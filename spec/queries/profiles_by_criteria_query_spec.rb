require 'rails_helper'

describe ProfilesByCriteriaQuery do
  let!(:state_1) { create(:state, name: 'Rio Grande do Sul') }
  let!(:state_2) { create(:state, name: 'Santa Catarina') }
  let!(:state_3) { create(:state, name: 'São Paulo') }

  let!(:profile_1) do
    create(:profile, age: 12,
                     state: state_1,
                     profession: 'full stack developer')
  end

  let!(:profile_2) do
    create(:profile, age: 20, state: state_2, profession: 'designer')
  end

  let!(:profile_3) do
    create(:profile, age: 17, state: state_3, profession: 'ux')
  end

  let!(:profile_4) do
    create(:profile, age: 32, state: state_3, profession: 'developer')
  end

  let(:options) { {} }

  let(:instance) { described_class.new(Profile, options) }

  subject { instance.by_criteria.all.to_a }

  describe 'invalid criteria' do
    let(:options) do
      {invalid: true}
    end

    it do
      is_expected.to match_array([profile_1, profile_2, profile_3, profile_4])
    end
  end

  describe 'profession equals' do
    let(:options) do
      {profession_criteria: 'equals', profession_value: 'developer'}
    end

    it { is_expected.to match_array([profile_4]) }
  end

  describe 'profession contains' do
    let(:options) do
      {profession_criteria: 'contains', profession_value: '%developer'}
    end

    it { is_expected.to match_array([profile_1, profile_4]) }
  end

  describe 'profession not contains' do
    let(:options) do
      {profession_criteria: 'not_contains', profession_value: '%developer'}
    end

    it { is_expected.to match_array([profile_2, profile_3]) }
  end

  describe 'age greater than' do
    let(:options) do
      {age_criteria: 'greater_than', age_value: 19}
    end

    it { is_expected.to match_array([profile_2, profile_4]) }
  end

  describe 'age less than' do
    let(:options) do
      {age_criteria: 'less_than', age_value: 17}
    end

    it { is_expected.to match_array([profile_1]) }
  end

  describe 'state in' do
    let(:options) do
      {state_id_criteria: 'in', state_id_value: [state_3.id, state_1.id]}
    end

    it { is_expected.to match_array([profile_1, profile_3, profile_4]) }
  end

  context 'match all' do
    describe 'age greater_than and profession contains' do
      let(:options) do
        {
          match: :all,
          age_criteria: 'greater_than',
          age_value: 19,
          profession_criteria: 'contains',
          profession_value: '%developer'
        }
      end

      it { is_expected.to match_array([profile_4]) }
    end

    describe 'age greater_than, profession contains and state in' do
      let(:options) do
        {
          match: :all,
          age_criteria: 'greater_than',
          age_value: 11,
          profession_criteria: 'contains',
          profession_value: '%developer',
          state_id_criteria: 'in',
          state_id_value: state_1.id
        }
      end

      it { is_expected.to match_array([profile_1]) }
    end
  end

  context 'match any' do
    describe 'age greater_than or profession contains' do
      let(:options) do
        {
          match: :any,
          age_criteria: 'greater_than',
          age_value: 20,
          profession_criteria: 'contains',
          profession_value: '%developer'
        }
      end

      it { is_expected.to match_array([profile_1, profile_4]) }
    end
  end
end
