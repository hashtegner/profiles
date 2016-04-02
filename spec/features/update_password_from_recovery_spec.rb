require 'rails_helper'

RSpec.feature 'Update password from recovery' do
  let(:profile) { create(:profile) }
  let(:reset_password_token) { profile.send_reset_password_instructions }

  before do
    visit edit_profile_password_path(reset_password_token: reset_password_token)
  end

  context 'with valid token' do
    scenario 'update password' do
      fill_in t('devise.passwords.edit.new_password'),
              with: profile.password

      fill_in t('devise.passwords.edit.confirm_new_password'),
              with: profile.password

      click_button t('devise.passwords.edit.submit')

      expect(page).to have_text(t('devise.passwords.updated'))
    end
  end

  context 'with invalid token' do
    let(:reset_password_token) { 'invalid' }

    scenario 'show errors with invalid infos' do
      click_button t('devise.passwords.edit.submit')

      expect(page).to have_text(t('errors.messages.not_saved'))
    end
  end
end
