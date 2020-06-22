Rails.application.routes.draw do
  resources :comments, only: [:show, :create]
  resources :posts, only: [:index, :show, :create, :update]

  #resources :posts, only: [:show] do
  #  resources :comments, only: [:index, :create]
  #end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
