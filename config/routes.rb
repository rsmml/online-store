Rails.application.routes.draw do

  devise_for :users
  resources :products
  resources :shops, only: %i[index show]
  resources :order_items
  resource :carts, only: :show

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
