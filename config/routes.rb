Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root 'task_mgmt_pages#index'

  resources :users
  resources :lists
  resources :boards do
    get "join" => "board#join"
  end
  resources :groups do
    member do
      post :invitation
    end
  end
end
