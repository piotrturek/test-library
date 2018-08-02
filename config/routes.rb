Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: "dashboard#index"

  namespace :library do
    resources :borrows, only: [:index]
    resources :books do
      member do
        get :borrow_book
        get :return_book
      end
    end
  end

end
