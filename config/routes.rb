Rails.application.routes.draw do
  root to: 'posts#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :likes, only: [:create, :destroy]
  resources :posts do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end
end
