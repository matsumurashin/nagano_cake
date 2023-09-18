Rails.application.routes.draw do

    get 'search' => 'search#search'

  namespace :admin do
    get 'orders/:id' => 'sessions#new'

    get 'customers' => 'customers#index'
    get 'customers/:id' => 'customers#show'
    get 'customers/:id/edit' => 'customers#edit'
    patch 'customers/:id' => 'customers#update'

    get 'items' => 'items#index'
    get 'items/new' => 'items#new'
    post 'items' => 'items#create'
    get 'items/:id' => 'items#show'
    get 'items/:id/edit' => 'items#edit'
    patch 'items/:id' => 'items#update'

    get '/' => 'homes#top'

    get 'admin/sign_in' => 'admin/sessions#new'
  end

  scope module: :public do
    get 'orders/new' => 'orders#new'
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'
    post 'orders' => 'orders#create'
    get 'orders' => 'orders#index'
    get 'orders/:id' => 'orders#show'

    get 'cart_items' => 'cart_items#index'
    patch 'cart_items/:id' => 'cart_items#update'
    delete 'cart_items/:id' => 'cart_items#destroy'
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    post 'cart_items' => 'cart_items#create'

    get 'customers/mypage' => 'customers#show'
    get 'customers/infomation/edit' => 'customers#edit'
    patch 'customers/infomation' => 'customers#update'
    get 'customers/check' => 'customers#check'
    patch 'customers/withdraw' => 'customers#withdraw'

    get 'items' => 'items#index'
    get 'items/:id' => 'items#show'

    root to: 'homes#top'
    get 'about' => 'homes#about'
  end

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
