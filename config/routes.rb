Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  resources :surveys, only: [:index, :show]

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admins/sessions"
  }

  namespace :admins do
    get 'users/index'
    get 'users/show'
    resources :users, only: [:index, :show]
    resources :surveys do
      resources :questions, only: [:destroy]
      get 'questions/new', to: 'surveys#new_question', as: :new_question
    end
  end

  root 'surveys#home'
end
