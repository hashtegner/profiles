require 'rails_helper'

RSpec.feature 'Login' do
  let(:profile) { create(:profile) }

  before { visit new_profile_session_path }

  scenario 'authenticate user with valid credentials' do
    sign_in profile

    expect(page).to have_text(t('devise.sessions.signed_in'))
  end

  scenario 'show errors with invalid credentials' do
    click_button t('devise.sessions.new.submit')

    expect(page).to have_text(
      t('devise.failure.profile.invalid')
    )
  end
end
