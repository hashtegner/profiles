module FeatureHelpers
  def sign_in(profile)
    visit new_profile_session_path

    fill_in t('activerecord.attributes.profile.email'), with: profile.email
    fill_in t('activerecord.attributes.profile.password'),
            with: profile.password

    click_button t('devise.sessions.new.submit')
  end
end
