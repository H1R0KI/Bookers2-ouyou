Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'

  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
    resource :favorites, only: [:create, :destroy]
    resource :post_comments, only: [:create, :destroy]
  end
  
  resources :users, only: [:show, :index, :edit, :update] do
    resource :follows, only: [:create, :destroy]
    get 'followings' => 'follows#followings', as: 'followings'
    get 'followers' => 'folllows#followers', as: 'followers'
  end

end