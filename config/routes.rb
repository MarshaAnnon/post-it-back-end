Rails.application.routes.draw do
  resources :comments, only: [:show, :create]
  resources :posts, only: [:index, :show, :create, :update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
