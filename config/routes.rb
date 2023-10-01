Rails.application.routes.draw do
  namespace :api do
    resources :products do
      get 'get_by_name', on: :collection
    end

    resources :categories do
    end

    root to: 'products#index'
    # Defines the root path route ("/")
    # root "articles#index"
  end
end
