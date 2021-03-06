Rails.application.routes.draw do
  root to: "posts#index"
  devise_for :users

  resources :posts do
    resources :messages, only: [:index, :new, :create, :show, :destroy, :edit]
  end
  
   resources :users, only: [:show]

end
