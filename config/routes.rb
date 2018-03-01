Rails.application.routes.draw do
  devise_for :users
  resource :user
  root "books#index"

  resources :books do

  end

  namespace :account do
    resources :books do
      member do
        post :publish
        post :hide
      end
    end
  end
end
