Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  resources :users do
    resources :jobs, only: %i[index show]
    patch 'jobs/:id', to: 'jobs#mark_as_done', as: "mark_done"
    delete 'jobs/:id', to: 'jobs#mark_as_canceled', as: "mark_canceled"
    get 'offers', to: 'offers#my_services', as: "my_services"
  end

  resources :offers do
    resources :jobs, only: %i[create edit update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
