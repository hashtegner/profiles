require 'rails_helper'

RSpec.feature 'Search Profiles' do
  context 'authenticated profile' do
    let(:current_profile) { create(:profile, age: 28) }

    let!(:profile_1) { create(:profile, email: 'alex@example.com', age: 12) }
    let!(:profile_2) { create(:profile, email: 'ben@example.com', age: 22) }
    let!(:profile_3) { create(:profile, email: 'carlos@example.com', age: 22) }

    let!(:saved_query) do
      create(:saved_query,
             profile: current_profile,
             parameters: {match: 'all', age_criteria: 'equals', age_value: 12}
            )
    end

    before { sign_in current_profile }

    scenario 'load profiles by params criteria' do
      visit search_path(
        criteria: {match: 'all', age_criteria: 'equals', age_value: 22}
      )

      expect(page).to have_text(profile_2.email)
      expect(page).to have_text(profile_3.email)
      expect(page).to_not have_text(profile_1.email)
    end

    scenario 'load ordered and paginated data' do
      Profile.paginates_per 2

      visit search_path

      expect(page).to have_text(profile_1.email)
      expect(page).to have_text(profile_2.email)
      expect(page).to_not have_text(profile_3.email)

      click_link t('views.pagination.next')

      expect(page).to_not have_text(profile_1.email)
      expect(page).to_not have_text(profile_2.email)
      expect(page).to have_text(profile_3.email)
    end
  end

  context 'unauthenticated' do
    scenario 'redirect to login path' do
      visit search_path

      expect(current_path).to eql(new_profile_session_path)
    end
  end
end
