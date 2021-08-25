Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  resources :users do
    resources :orders, only: %i[index show]
    patch 'orders/:id', to: 'orders#mark_as_done', as: "mark_done"
    delete 'orders/:id', to: 'orders#mark_as_canceled', as: "mark_canceled"
    get 'translation_services', to: 'translation_services#my_services', as: "my_services"
  end

  resources :translation_services do
    resources :orders, only: %i[create edit update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
