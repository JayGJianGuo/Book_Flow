Rails.application.routes.draw do
  devise_for :users
  root "books#index"

  resources :books, only: [:index, :show]

  resource :user

  namespace :account do

    resources :books do
      member do
        post :publish
        post :hide
      end
    end

    resources :users do
      resource :profile, :controller => "user_profiles"
    end

  end
end
