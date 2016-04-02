class RegistrationsController < Devise::RegistrationsController
  protected

  def sign_up_params
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i(age state_id title_position))

    super
  end
end
