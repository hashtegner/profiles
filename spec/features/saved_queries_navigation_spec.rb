require 'rails_helper'

RSpec.feature 'Saved query navigations' do
  let!(:other_profile) { create(:profile) }
  let!(:other_saved_query) do
    create(:saved_query, profile: other_profile)
  end

  let!(:current_profile) { create(:profile) }
  let!(:saved_query) { create(:saved_query, profile: current_profile) }

  before { sign_in current_profile }

  scenario 'users see their saved queries' do
    visit root_path

    expect(page).to have_selector('a', text: saved_query.name)
    expect(page).to_not have_selector('a', text: other_saved_query.name)
  end

  scenario 'marks the active query when click and prevents to save again' do
    visit root_path

    click_link saved_query.name

    expect(page).to have_selector('li.active', text: saved_query.name)
    expect(page).to_not have_selector('a', text: t('profiles.search_form.save'))
  end
end
