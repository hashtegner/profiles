Rails.application.routes.draw do
  devise_for :profiles, controllers: {registrations: :registrations}

  root 'profiles#index'

  controller :profiles do
    get :search
  end
end
