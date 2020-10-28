Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources "items", only: [:new, :create] do
  end
  resources "items", only: [:show, :destroy] do
    collection do
      get 'purchase'
    end
  end
  resources :users, only: :show
  resources :items, only: [:new, :create] do
  end
end
