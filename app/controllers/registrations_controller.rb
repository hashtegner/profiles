class RegistrationsController < Devise::RegistrationsController
  protected

  def sign_up_params
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i(age state_id job_title))

    super
  end
end
