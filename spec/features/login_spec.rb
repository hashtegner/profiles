require 'rails_helper'

RSpec.feature 'User sign up' do
  let(:profile) { create(:profile) }

  before { visit new_profile_session_path }

  scenario 'With valid credentials' do
    fill_in t('activerecord.attributes.profile.email'), with: profile.email
    fill_in t('activerecord.attributes.profile.password'),
            with: profile.password

    click_button t('devise.sessions.new.submit')

    expect(page).to have_text(t('devise.sessions.signed_in'))
  end

  scenario 'With invalid credentials' do
    click_button t('devise.sessions.new.submit')

    expect(page).to have_text(
      t('devise.failure.profile.invalid')
    )
  end
end
