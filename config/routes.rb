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
    resource :friendships
  end
  resources :posts do
    resource :comments
  end
  resources :conversations
  resources :quests do
    resources :missions
  end
  resources :leaderboard
  resource :like

  get "/profile" => "users#profile", as: :profile

end
