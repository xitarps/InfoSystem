Rails.application.routes.draw do
  scope '(:locale)', locale: /es|pt-BR/ do
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    root 'home#index'

    devise_for :users
    resources :users, only: %i[index show]
    patch 'toggle_admin', to: 'users#toggle_admin'

    resources :friendships, only: %i[create destroy]

    resources :articles
    resources :videos

    resources :categories, except: %i[destroy]

    resources :likes, only: %i[create destroy]
  end
end
