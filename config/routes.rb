Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: "overrides/registrations"}

  mount RailsAdmin::Engine => '/captainslounge', as: 'rails_admin'

  unauthenticated do
    root to: "home#index"
  end

  authenticated do
    root to: "home#dashboard", as: :authenticated_root
  end

  resources :users do
    member do
      get :friends
    end
  end
  resources :posts

  get "/profile" => "users#profile", as: :profile

end
