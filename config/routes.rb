Rails.application.routes.draw do
  root to: 'posts#index'
  devise_for :users

  resources :posts do
    resources :comments, only: [:create,:show,:destroy]
  end

  resources :users, only: [:show,:edit,:update,:destroy]
end
