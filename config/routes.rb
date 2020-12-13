Rails.application.routes.draw do

  get 'categories/index'
  get 'categories/show'
  get 'categories/new'
  get 'categories/create'
  get 'categories/edit'
  get 'categories/update'
  get 'categories/destroy'
  get 'product_categories/index'
  get 'product_categories/show'
  get 'product_categories/new'
  get 'product_categories/create'
  get 'product_categories/edit'
  get 'product_categories/update'
  get 'product_categories/destroy'
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
