Rails.application.routes.draw do
  get 'orders/index'
  get 'orders/show'
  get 'orders/new'
  get 'carts/show'
  resources :users, only: [:new, :create]   
  get 'login', to: 'sessions#new'   
  post 'login', to: 'sessions#create'   
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  get 'logout', to: 'sessions#destroy'
  root to: 'products#index'
  resources :products do
    member do
      get :add_to_cart
    end
  end

  post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
  post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
  post 'line_items' => "line_items#create"
  get 'line_items/:id' => "line_items#show", as: "line_item"
  post 'line_items/:id' => "line_items#destroy", as: "delete_line_item"
  get 'carts/:id' => "carts#show", as: "cart"
  post 'carts/:id' => "carts#destroy" , as: "delete_all"

  resources :orders
end
