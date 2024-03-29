Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "dashboard", to: "dashboards#show"
  resources :rooms, except: %i[edit destroy] do
    resources :messages, only: :create
  end

  resources :users, only: :show do
    resources :appointments, only: %i[update]
  end

  resources :appointments, only: %i[create update]
  resources :chatrooms, only: :show

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
