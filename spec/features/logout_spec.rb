require 'rails_helper'

RSpec.feature 'Logout' do
  let(:profile) { create(:profile) }
  before { sign_in(profile) }

  scenario 'redirect to login path' do
    visit root_path
    click_link t('views.sign_out')

    expect(current_path).to eql(new_profile_session_path)

    visit root_path

    expect(current_path).to eql(new_profile_session_path)
  end
end
