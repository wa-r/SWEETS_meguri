Rails.application.routes.draw do
  root 'homes#top'
  devise_for :admins
  devise_for :members
  scope module: :member do
    resources :members, only: [:show, :edit, :update]
    get '/members/:id/unsubscribe' => 'members#unsubscribe', as: 'unsubscribe'
    patch '/members/:id/withdrawal' => 'members#withdrawal', as: 'withdrawal'
  end
end