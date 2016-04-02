Rails.application.routes.draw do
  devise_for :profiles, controllers: {registrations: :registrations}

  root 'criterias#index'
end
