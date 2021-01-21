Rails.application.routes.draw do
  namespace :member do
    get 'relationships/create'
    get 'relationships/destroy'
  end
  root 'homes#top'
  devise_for :admins
  devise_for :members
  scope module: :member do
    resources :members, only: [:show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get :follows, on: :member # 追加
      get :followers, on: :member # 追加
      # get 'follows/:id' => 'relationships#follows', as: 'follows'
      # get 'follower/:id' => 'relationships#follower', as: 'follower'
    end
    get '/members/:id/unsubscribe' => 'members#unsubscribe', as: 'unsubscribe'
    patch '/members/:id/withdrawal' => 'members#withdrawal', as: 'withdrawal'
    resources :tweets, except: [:show]
  end
end