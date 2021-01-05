Rails.application.routes.draw do
  devise_for :users
  resources :products
  resources :shops, only: %i[index show]
  resource :carts, only: :show do
    collection do
      delete :destroy_all
    end
  end

  resources :product_categories
  resources :categories

  resources :order_items do
    resources :products
  end

  root to: 'pages#home'

  # API
  namespace :api do
    namespace :v1 do
      devise_for :users
      resources :products
      resources :shops, only: %i[index show]
      resource :carts, only: :show do
        collection do
          delete :destroy_all
        end
      end

      resources :product_categories
      resources :categories

      resources :order_items do
        resources :products
      end

      root to: 'pages#home'
    end
  end
end
