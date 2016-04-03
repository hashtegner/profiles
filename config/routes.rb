Rails.application.routes.draw do
  devise_for :profiles, controllers: {registrations: :registrations}

  root 'profiles#search'

  controller :profiles do
    get :search
  end

  resources :saved_queries, only: [:new, :create]
end
