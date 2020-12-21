# frozen_string_literal: true

Rails.application.routes.draw do
  get 'comments/create'
  resources :users, only: %i[new create update edit show]
  resources :sessions, only: [:create]
  resources :comments, only: %i[create destroy]
  resources :posts, only: %i[new create update destroy show]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'newpost', to: 'posts#new', as: 'newpost'
  get 'profile', to: 'users#show', as: 'profile'

  root 'home#index'
end
