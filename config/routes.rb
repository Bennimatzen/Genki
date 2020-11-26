Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
  resources :users, only: [:edit, :update] do
    resources :appointments, only: [:index]
    resources :doctors, only: [:new, :create]
    collection do
      get "profile", to:  "users#profile", as: :profile
    end
  end

  resources :symptom_checks, only: [:new, :create]
  resources :appointments, only: [:destroy]
  resources :doctors, only: [:show, :index]  do
    resources :appointments, only: [:new, :create]
  end
  resources :diseases, only: [:new, :create] do
    resources :symptoms, only: [:index, :new, :create]
  end
end
