Rails.application.routes.draw do
  root 'homes#top'
  devise_for :admins
  devise_for :members
  scope module: :member do
    resources :members, only: [:show, :edit, :update]
    get '/unsubscribe' => 'members#unsubscribe'
    patch '/withdrawal' => 'members#withdrawal'
  end
end