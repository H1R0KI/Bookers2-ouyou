Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "home/about" => "homes#about"

  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
    resource :favorites, only: [:create, :destroy]
    resource :post_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :index, :edit, :update] do
    resource :follows, only: [:create, :destroy]
    get "followings" => "follows#followings", as: "followings"
    get "followers" => "follows#followers", as: "followers"
  end

  resources :chats, only: [:show, :create]

  resources :groups, only: [:index, :show, :edit, :create, :update, :new, :show]
  resources :groups do
    get "join" =>"groups#join"
    get "new/mail" => "groups#new_mail"
    get "send/mail" => "groups#send_mail"
  end

  get "search" => "searches#search"

  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
end
