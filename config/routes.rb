Rails.application.routes.draw do
  resources :contacts
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
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
