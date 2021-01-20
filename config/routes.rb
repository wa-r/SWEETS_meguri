Rails.application.routes.draw do
  root 'homes#top'
  devise_for :members
  devise_for :admins
  resources :members, only: [:show, :edit, :update]
  get '/unsubscribe' => 'members#unsubscribe'
  patch '/withdrawal' => 'members#withdrawal'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end