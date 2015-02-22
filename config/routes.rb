Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: "overrides/registrations"}

  mount RailsAdmin::Engine => '/captainslounge', as: 'rails_admin'

  unauthenticated do
    root to: "home#index"
  end

  authenticated do
    root to: "home#dashboard", as: :authenticated_root
  end

  resources :users
  resources :posts

end
