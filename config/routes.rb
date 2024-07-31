Rails.application.routes.draw do
  resources :surveys, only: [:index, :show]
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admins/sessions"
  }
  namespace :admins do
    resources :surveys do
      resources :questions, only: [:destroy]
      get 'questions/new', to: 'surveys#new_question', as: :new_question
    end
  end
  root 'surveys#home'
end
