Rails.application.routes.draw do
  resources :comments, only: [:show, :create]
  resources :posts, only: [:index, :show, :create, :update]

  resources :post, only: [:show] do
    resources :comments, only: [:show, :create]
  end

end
