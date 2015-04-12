Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: "overrides/registrations"}

  mount RailsAdmin::Engine => "/captainslounge", as: "rails_admin"
  mount Rapidfire::Engine => "/surveys"

  unauthenticated do
    root to: "home#index"
  end

  authenticated do
    root to: "home#dashboard", as: :authenticated_root
  end

  resources :users do
    member do
      get :achievements
    end
    resource :friendships do
      collection do
        post :search
      end
    end
  end
  resources :posts do
    resource :comments
  end
  resources :conversations
  resources :quests do
    collection do
      get :display
    end

    resources :missions do
      member do
        put :accept
        delete :cancel
        delete :reject
      end
    end
  end
  resources :bounties
  resources :leaderboard
  resources :rewards
  resource :like

  namespace :admin do
    resources :missions do
      collection do
        get :completed
        get :submitted
        get :accepted
      end
    end
    resources :bounties
  end

  get "/profile" => "users#profile", as: :profile
  get "/privacy" => "home#privacy", as: :privacy
  get "/about" => "home#about", as: :about
  get "/contact" => "home#contact", as: :contact


end
