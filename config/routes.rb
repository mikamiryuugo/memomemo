Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "toppages#index"
  resources :users do
    member do
      get :followings
      get :followers
    end
  end
  resources :searches, only: [:index]
  resources :memos
  resources :profiles, only: [:new, :create]
  resources :relationships, only: [:create, :destroy]
end
