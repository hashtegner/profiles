require 'rails_helper'

RSpec.feature 'Request password recovery' do
  let(:profile) { create(:profile) }

  before { visit new_profile_password_path }

  scenario 'send instructions with valid user' do
    fill_in t('activerecord.attributes.profile.email'), with: profile.email

    click_button t('devise.passwords.new.submit')

    expect(page).to have_text(t('devise.passwords.send_instructions'))
  end

  scenario 'show error with invalid user' do
    fill_in t('activerecord.attributes.profile.email'), with: 'invalid'
    click_button t('devise.passwords.new.submit')

    expect(page).to have_text(t('errors.messages.not_found'))
  end
end
