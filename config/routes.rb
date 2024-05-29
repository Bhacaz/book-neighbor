Rails.application.routes.draw do
  root 'books#index'
  resources :books do
    member do
      get :similar
    end
  end
  get 'home/index'
end
