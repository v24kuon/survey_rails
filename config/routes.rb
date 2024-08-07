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
    resources :surveys
    resources :questions, only: [:new, :create, :destroy]
  end

  root 'surveys#home'
end
