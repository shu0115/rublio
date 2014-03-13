Rublio::Application.routes.draw do
  resources :groups
  resources :pages

  # For OmniAuth
  get "/auth/:provider/callback" => "sessions#callback"
  get "/auth/failure"            => "sessions#failure"
  get "/logout"                  => "sessions#destroy", as: :logout

  get "/my/search" => "my#search"
  get "/my/library" => "my#library"

  root to: 'top#index'
end
