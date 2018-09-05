Rails.application.routes.draw do

  root "application#hello"
  devise_for :users
  resources :items
  
end