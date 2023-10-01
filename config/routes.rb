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

  scope :api do #If you use it with namespace, the files should be under that folder (Pay Atention!!!)
    mount_devise_token_auth_for 'User', at: 'auth'
  end
end
