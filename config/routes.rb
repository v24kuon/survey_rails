Rails.application.routes.draw do
  resources :surveys, only: [:index, :show]
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admins/sessions"
  }
  namespace :admins do
    resources :surveys
  end
  root 'surveys#home'
end
