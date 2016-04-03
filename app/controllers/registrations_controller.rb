class RegistrationsController < Devise::RegistrationsController
  protected

  def sign_up_params
    sanitize_profile_params :sign_up
    super
  end

  def account_update_params
    sanitize_profile_params :account_update
    super
  end

  def sanitize_profile_params(key)
    devise_parameter_sanitizer.permit(key, keys: %i(age state_id job_title))
  end
end
