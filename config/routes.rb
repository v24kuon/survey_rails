Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  resources :surveys, only: [:index, :show] do
    resources :responses, only: [:new, :create]
  end
  resources :responses, except: [:new, :create]

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admins/sessions"
  }

  get '/admins', to: 'admins/surveys#index'

  namespace :admins do
    resources :users, only: [:index, :show]
    resources :surveys do
      resources :responses, only: [:index, :show]
    end
    resources :questions, only: [], param: :index do
      member do
        delete '(:id)' => "questions#destroy", as: ""
        post '/' => "questions#create"
      end
    end
    resources :choices, only: [], param: :index do
      member do
        delete '(:id)' => "choices#destroy", as: ""
        post '/' => "choices#create"
      end
    end
  end

  root 'surveys#home'
end
