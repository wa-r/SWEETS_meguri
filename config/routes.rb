Rails.application.routes.draw do

  root 'homes#top'
  resource :contacts, only: [:new, :create]
  get 'contacts/thanks' => 'contacts#thanks'
  devise_for :admins
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :shops
  end

  devise_for :members
  scope module: :member do
    get 'search/shops' => 'shops#search'
    resources :members, only: [:show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get :follows, on: :member # 追加
      get :followers, on: :member # 追加
      # get 'follows/:id' => 'relationships#follows', as: 'follows'
      # get 'follower/:id' => 'relationships#follower', as: 'follower'
    end

    get 'members/:id/bookmarks' => 'members#bookmarks', as: 'bookmarks'
    get 'members/:id/tweet_likes' => 'members#tweet_likes', as: 'tweet_likes'
    get '/members/:id/unsubscribe' => 'members#unsubscribe', as: 'unsubscribe'
    patch '/members/:id/withdrawal' => 'members#withdrawal', as: 'withdrawal'

    resources :tweets do
      resource :tweet_likes, only: [:create, :destroy]
      resources :tweet_comments, only: [:create, :destroy]
    end

    # get 'search/shops' => 'member/shops#search'
    resources :shops do
      resource :bookmarks, only: [:create, :destroy]
      resources :reviews
    end

    get 'genres/cake' => 'genres#cake'
    get 'genres/macaron' => 'genres#macaron'
    get 'genres/chocolate' => 'genres#chocolate'
    get 'genres/parfait' => 'genres#parfait'
    get 'genres/cafe' => 'genres#cafe'
    get 'genres/shaved_ice' => 'genres#shaved_ice'
  end
end