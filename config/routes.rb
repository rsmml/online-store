Rails.application.routes.draw do

  devise_for :users
  resources :products
  resources :shops, only: %i[index show]
  resource :carts, only: :show do
    collection do
      delete :destroy_all
    end
  end

  resources :order_items do
    resources :products
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
