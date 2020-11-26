Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
  resources :users, only: [:edit, :update] do
    resources :doctors, only: [:new, :create]
    collection do
      get "profile", to:  "users#profile", as: :profile
    end
  end

  resources :symptom_checks, only: [:new, :create]
  resources :doctors, only: [:show]
  resources :diseases, only: [:new, :create] do
    resources :symptoms, only: [:index, :new, :create]
  end
end
