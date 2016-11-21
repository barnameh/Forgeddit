Rails.application.routes.draw do
  resources :users, only: [:new, :create] do
    resources :comments, only: [:index]
  end
  resource :session, only: [:new, :create, :destroy]

  resources :links, only: [:new, :create, :index] do
    resources :comments, except: [:edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
