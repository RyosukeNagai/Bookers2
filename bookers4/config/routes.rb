Rails.application.routes.draw do
  devise_for :users
  root 'home#top'
  get 'home/about'
  resources :users,only: [:show,:index,:edit,:update]
  resources :relationships, only: [:create, :destroy]
  resources :books do
  resource :book_comments, only: [:create]
  resource :favorites, only: [:create, :destroy]
  end
  resources :book_comments, only: [:destroy]
  
end

