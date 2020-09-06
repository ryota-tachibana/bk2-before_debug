Rails.application.routes.draw do

  devise_for :users
  resources :users,only: [:show,:index,:edit,:update] do
  resource :relationships, only: [:create, :destroy]
  get 'follows' => 'relationships#follower', as: 'follows'
  get 'followers' => 'relationships#followed', as: 'followers'
  end
  resources :books do
  resources :book_comments, only: [:create, :destroy]
  resource :favorites, only: [:create, :destroy]
  end
  root 'home#top'
  get 'home/about'
  get '/search' => 'search#search'
  end