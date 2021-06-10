Rails.application.routes.draw do
  devise_for :users
  
  root to: "posts#index"

  resources :posts do
    resources :messages, only: [:index, :new, :create, :show, :destroy, :edit]
  end
  
  resources :users, only: [:show]

end
