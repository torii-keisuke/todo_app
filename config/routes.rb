Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root to: "boards#index"
  resources :users
  resources :boards do
    get "join" => "board#join"
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
