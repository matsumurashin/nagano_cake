Rails.application.routes.draw do
  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :admin do
    get 'items/index'
    get 'items/new'
    get 'items/show'
    get 'items/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/complete'
    get 'orders/idex'
    get 'orders/show'
  end
  namespace :public do
    get 'cart_items/index'
  end
  namespace :public do
    get 'cutomers/show'
    get 'cutomers/edit'
    get 'cutomers/check'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end

  namespace :pubkic do
    get 'customers/sign_up' => 'registrations/new#sign_up'
  end

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  # 会員側のルーティング設定

  #管理者側のルーティング設定

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
