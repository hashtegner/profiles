require 'rails_helper'

RSpec.feature 'Profile update' do
  context 'authenticated' do
    let!(:current_profile) { create(:profile, age: 25, job_title: 'dev') }

    before do
      sign_in current_profile
    end

    scenario 'update profile with valid params' do
      visit root_path

      click_link t('views.edit_profile')

      fill_in t('activerecord.attributes.profile.job_title'),
              with: 'full stack developer'

      fill_in t('activerecord.attributes.profile.age'),
              with: 26

      fill_in t('activerecord.attributes.profile.current_password'),
              with: current_profile.password

      click_button t('helpers.submit.update',
                     model: Profile.model_name.human.downcase)

      current_profile.reload

      expect(current_path).to eql(root_path)
      expect(current_profile.age).to eql(26)
      expect(current_profile.job_title).to eql('full stack developer')
    end

    scenario 'render form with invalid params' do
      visit root_path

      click_link t('views.edit_profile')

      click_button t('helpers.submit.update',
                     model: Profile.model_name.human.downcase)

      expect(current_path).to eql(profile_registration_path)
      expect(page).to have_field(t('activerecord.attributes.profile.email'))
    end
  end

  it_behaves_like 'unauthenticated' do
    let(:path) { edit_profile_registration_path }
  end
end
