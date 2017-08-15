Rails.application.routes.draw do


  resources :categories, only: [:show]

  resources :trips do
    resources :items, only: [:index, :edit, :update, :destroy]
  end



  root 'welcome#home'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }


end
