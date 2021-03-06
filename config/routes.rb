Rails.application.routes.draw do
  devise_for :users

  resources :users do
    resources :reviews
  end

  resources :reviews

  resources :games do
    resources :reviews
  end

  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
