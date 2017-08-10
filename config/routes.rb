Rails.application.routes.draw do

  resources :items

  resources :categories

  resources :trips

  root 'welcome#home'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }




  # resources :items, only: [:show, :index]
  # resources :categories, only: [:show, :index]
  # resources :users, only: [:show]
  # resources :carts
  # resources :line_items, only: [:create]
  # resources :orders, only: [:show]
  #
  # post 'carts/:id/checkout', to: 'carts#checkout', as: 'checkout'

end
