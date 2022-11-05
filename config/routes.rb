require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  # Defines the root path route ("/")
  root "welcome#index"

  get "checkins/:id/checked", to: "checkins#checked", as: "checked"
  patch "checkins/:id/checked", to: "checkins#checked"
  
  get "checkins/confirma", to: "checkins#confirma", as: "confirma"

  resources :checkins
  resources :criancas
  devise_for :usuarios, controllers: {
    omniauth_callbacks: 'usuarios/omniauth_callbacks',
    sessions: 'usuarios/sessions',
    registrations: 'usuarios/registrations'
  }

end
