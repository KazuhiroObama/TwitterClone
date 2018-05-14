Rails.application.routes.draw do
  root to: 'users#top'
  resources :blogs do
    collection do
      post :confirm
      get :top
    end
  end
  resources :users do
    collection do
      get :top
    end
  end
  resources :sessions, only: [ :new, :create, :destroy ]
  resources :favorites, only: [:create, :destroy]
end
