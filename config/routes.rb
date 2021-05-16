# frozen_string_literal: true

Rails.application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'external', to: 'spendings#external', as: 'external'
  root 'users#index'

  resources :users
  resources :spendings
  resources :groups
  resources :sessions
end
