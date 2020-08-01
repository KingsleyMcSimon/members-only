# frozen_string_literal: true

Rails.application.routes.draw do

  root 'capts#index'
  get 'capts/edit', to: 'capts#edit'
  delete 'capts/delete', to: 'capts#destroy'
  get 'capts/update', to: 'capts#update'
  resources :capts
  

  devise_for :users, controllers: { registrations: 'registrations' }
  resources :capts, only: [:new, :create, :edit, :destroy, :update, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
