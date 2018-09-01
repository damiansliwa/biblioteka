Rails.application.routes.draw do

  root "application#hello"
  get 'items/new'
  devise_for :users

end