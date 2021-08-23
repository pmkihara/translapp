Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :translation_services
  resources :orders, only: %i[edit update show destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
