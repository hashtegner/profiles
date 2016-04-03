require 'rails_helper'

RSpec.feature 'User sign up' do
  let!(:state) { create(:state) }
  let(:profile) { attributes_for(:profile) }

  before { visit new_profile_registration_path }

  scenario 'create a new user with valid parameters' do
    fill_in t('activerecord.attributes.profile.email'), with: profile[:email]

    fill_in t('activerecord.attributes.profile.password'),
            with: profile[:password]

    fill_in t('activerecord.attributes.profile.password_confirmation'),
            with: profile[:password]

    fill_in t('activerecord.attributes.profile.age'), with: profile[:age]

    select state.name, from: t('activerecord.attributes.profile.state')

    fill_in t('activerecord.attributes.profile.job_title'),
            with: profile[:job_title]

    click_button t('devise.registrations.new.submit')

    expect(page).to have_text(t('devise.registrations.signed_up'))
  end

  scenario 'show errors with invalid parameters' do
    click_button t('devise.registrations.new.submit')

    expect(page).to have_text(
      t('simple_form.error_notification.default_message')
    )
  end
end
