# frozen_string_literal: true

Rails.application.routes.draw do

  root 'capts#index'

  devise_for :users, controllers: { registrations: 'registrations' }
  resources :capts, only: [:new, :create, :edit, :destroy, :update, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
