Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }

  devise_scope :user do
    put "confirmation", to: "users/confirmations#show", as: :back_confirmation
  end

  root to: "boards#index"
  resources :users
  resources :boards do
    get "join" => "board#join"
    resources :favorites, only: [:create, :destroy]
    resources :lists do
      resources :cards
    end
  end
  resources :groups do
    member do
      post :invitation
    end
  end
end
