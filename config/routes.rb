Rails.application.routes.draw do
  devise_for :users
  root "books#index"

  resources :books do

  end

  resource :user

  namespace :account do
    resource :user do
      resource :profile, :controller => "user_profiles"
    end
    resources :books do
      member do
        post :publish
        post :hide
      end
    end
  end
end
