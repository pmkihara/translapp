Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :translation_services do
    resources :orders, only: %i[create edit update show destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
