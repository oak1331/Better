Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'

  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    collection do
      get :search, :latest, :popular
    end
  end

  resources :users, only: [:edit, :update, :show] do
    member do
      get :followings, :followers, :likes
    end
  end
  
  resources :relationships, only: [:create, :destroy]
end
