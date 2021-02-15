Rails.application.routes.draw do
  scope '(:locale)', locale: /es|pt-BR/ do
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    devise_for :users
    root 'home#index'
  end
end
