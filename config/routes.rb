# frozen_string_literal: true

Rails.application.routes.draw do

  # require 'sidekiq/web'
  # mount Sidekiq::Web => '/sidekiq'

  namespace :api do
    namespace :v1 do
      resources :items
      resources :orders
      resources :customers
      resources :transactions
      post '/customer/:id/orders', to: 'orders#create'
      post '/customer/:id/transactions', to: 'transactions#create'
    end
  end
end
