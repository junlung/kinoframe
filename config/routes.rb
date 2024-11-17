Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "/me", to: 'users/users#me'

  # Defines the root path route ("/")
  # root "posts#index"

  namespace :api do
    resources :movies, only: [:index, :show]
    resources :movie_lists, only: [:index, :show, :create] do
      post 'add_item', on: :member
    end
  end

  post 'auth/login', to: 'authentication#login'
  post 'auth/signup', to: 'authentication#signup'
end
