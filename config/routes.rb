Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: "dashboard#index"

  namespace :library do
    resources :borrows, only: [:index]
    resources :books
  end

end
