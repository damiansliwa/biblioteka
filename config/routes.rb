Rails.application.routes.draw do

  root "application#hello"
  devise_for :users
  get 'items/new'
  resources :items

end