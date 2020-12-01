Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  root to: 'users#profile'
  resources :users, only: [:show, :edit, :update] do

    resources :appointments, only: [:index]
    resources :doctors, only: [:new, :create]
    collection do
      get "profile", to:  "users#profile", as: :profile
    end
  end

  get "/pages/calls" => "pages#calls"

 resources :users do
    resources :prescriptions, only: [:index, :new, :create]
  end #this may need adjusting

  resources :symptom_checks, only: [:new, :create]
  resources :appointments, only: [:destroy]
  resources :doctors, only: [:show, :index]  do
    resources :appointments, only: [:new, :create]
  end

  resources :appointments, only: [:show] do
    resources :appointment_summaries, only: [:new, :create]
  end

  resources :appointment_summaries, only: [:show]

  resources :diseases, only: [:new, :create] do
    resources :symptoms, only: [:index, :new, :create]
  end

  resources :chats, only: [:index, :show, :create, :destroy] do
    resources :messages, only: [:create]
  end
end
