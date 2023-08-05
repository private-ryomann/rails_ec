# frozen_string_literal: true

Rails.application.routes.draw do
  root 'products#index'

  resources :tasks

  controller :products do
    resources :products, only: %i[index show update]
    namespace :admin do
      resources :products
    end
  end
end
