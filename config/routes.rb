Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  root to: 'pages#home'
  resources :users, only: [:show, :edit, :update] do

    resources :appointments, only: [:index]
    resources :doctors, only: [:new, :create]
    collection do
      get "profile", to:  "users#profile", as: :profile
    end
  end

  get "/pages/calls" => "pages#calls"
  get "/pages/about" => "pages#about"

 resources :users do
    resources :prescriptions, only: [:index, :new, :create, :show, :update]
  end #this may need adjusting

  resources :prescription_checks, only: [:create]

  resources :symptom_checks, only: [:new, :create]
  resources :appointments, only: [:destroy]
  resources :doctors, only: [:show, :index]  do
    resources :appointments, only: [:new, :create]
  end

  resources :appointments, only: [:show] do
    resources :appointment_summaries, only: [:new, :create]
  end

  resources :appointment_summaries, only: [:index, :show]

  resources :pharmacies, only: [:show, :index]

  resources :diseases, only: [:new, :create] do
    resources :symptoms, only: [:index, :new, :create]
  end

  resources :chats, only: [:index, :show, :create, :destroy] do
    resources :messages, only: [:create]
  end

  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end

  mount StripeEvent::Engine, at: '/stripe-webhooks'
end
