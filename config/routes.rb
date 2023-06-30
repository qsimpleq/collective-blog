Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :categories
  resources :posts do
    resources :comments, only: %i[new create destroy]
    resources :likes, only: %i[create destroy]
  end

  # Defines the root path route ("/")
  root "posts#index"
end
