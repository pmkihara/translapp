Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  resources :users do
    resources :orders, only: %i[index show destroy]
  end

  resources :translation_services do
    resources :orders, only: %i[create edit update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
