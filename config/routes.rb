Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:show]
  resources :diseases, only: [:new, :create] do
    resources :symptoms, only: [:new, :create]
  end
end
