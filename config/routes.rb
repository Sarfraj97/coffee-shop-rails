# frozen_string_literal: true

Rails.application.routes.draw do

  # require 'sidekiq/web'
  # mount Sidekiq::Web => '/sidekiq'

  namespace :api do
    namespace :v1 do
      resources :products
      resources :orders
      resources :customers
      post '/customer/:id/orders', to: 'orders#create'
    end
  end
end
