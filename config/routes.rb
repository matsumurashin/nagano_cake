Rails.application.routes.draw do
  namespace :admin do
    get 'orders/show'

    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'

    get 'items/index'
    get 'items/new'
    get 'items/show'
    get 'items/edit'

    get 'homes/top'

    get 'admin/sign_in' => 'admin/sessions#new'
  end

  namespace :public do
    get 'orders/new'
    get 'orders/complete'
    get 'orders/idex'
    get 'orders/show'

    get 'cart_items/index'

    get 'cutomers/mypage' => 'cutomers#show', as: 'customers/mypage'
    get 'cutomers/edit'
    get 'cutomers/check'

    get 'items/index'
    get 'items/show'

    get 'homes/top'
    get 'public/about' => 'homes#about', as: 'about'

    get 'customers/sign_up' => 'registrations/new#sign_up'
    get 'customers/sign_in' => 'new_customer_session'
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
