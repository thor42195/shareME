Rails.application.routes.draw do
  authenticated :user do
    root :to => "pictures#index"
  end
  root to: 'top#index'

  resources :pictures do
    collection do
      post :confirm
    end
  end
  devise_for :users
  resources :users #, only: %i(show)
  get '/users/favorites/:id', to:'users#favorites'
  resources :favorites, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
