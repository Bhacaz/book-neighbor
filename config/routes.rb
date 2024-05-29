Rails.application.routes.draw do
  root 'books#index'
  resources :books do
    member do
      get :similar
    end
    collection do
      get :random, as: :random
    end
  end
  get 'home/index'
end
