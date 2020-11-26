Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
  resources :users, only: [:edit, :update] do
    collection do
      get "profile", to:  "users#profile", as: :profile
    end
  end
  resources :symptom_checks, only: [:new, :create]
  resources :diseases, only: [:new, :create] do
    resources :symptoms, only: [:index, :new, :create]
  end
end
