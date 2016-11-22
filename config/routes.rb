Rails.application.routes.draw do
  resources :users, only: [:new, :create] do
    resources :comments, only: [:index, :new]
  end
  resource :session, only: [:new, :create, :destroy]

  resources :links, only: [:new, :create, :index] do
    resources :comments, only: [:index, :new]
  end

  resources :comments, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
