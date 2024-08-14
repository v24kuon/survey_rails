Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  resources :surveys, only: [:index, :show]

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admins/sessions"
  }

  namespace :admins do
    resources :users, only: [:index, :show]
    resources :surveys
    resources :questions, only: [], param: :index do
      member do
        delete '(:id)' => "questions#destroy", as: ""
        post '/' => "questions#create"
      end
    end
    resources :choices, only: [:new, :destroy]
  end

  root 'surveys#home'
end
