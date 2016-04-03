require 'rails_helper'

RSpec.feature 'Save search query' do
  let(:current_profile) { create(:profile, age: 28) }
  let(:name) { 'Users with 22 years old' }

  context 'authenticated' do
    before { sign_in current_profile }

    scenario 'create a new saved search with valid params' do
      select t('profiles.search_form.match_options.all'),
             from: t('profiles.search_form.match')

      select t('profiles.search_form.criteria_options.equals'),
             from: t('profiles.search_form.age_criteria')

      fill_in :criteria_age_value, with: 22

      click_button t('profiles.search_form.submit')

      click_link t('profiles.search_form.save')

      fill_in t('activerecord.attributes.saved_query.name'),
              with: name

      click_button t('helpers.submit.create',
                     model: SavedQuery.model_name.human.downcase)

      expect(page).to have_selector('a', text: name)
    end

    scenario 'show form when invalid parameters' do
      visit new_saved_query_path

      click_button t('helpers.submit.create',
                     model: SavedQuery.model_name.human.downcase)

      expect(current_path).to eql(saved_queries_path)
      expect(page).to have_field(t('activerecord.attributes.saved_query.name'))
    end
  end

  context 'unauthenticated' do
    scenario 'redirect to login path' do
      visit new_saved_query_path

      expect(current_path).to eql(new_profile_session_path)
    end
  end
end
