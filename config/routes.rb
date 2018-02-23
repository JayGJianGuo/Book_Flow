Rails.application.routes.draw do
  devise_for :users
  root "books#index"

  resources :books do

  end

  namespace :account do
    resources :books
  end
end
