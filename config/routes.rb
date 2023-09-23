Rails.application.routes.draw do
  namespace :api do
    resources :products
    resources :categories

    root to: 'products#index'
    # Defines the root path route ("/")
    # root "articles#index"
  end
end
