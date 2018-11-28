Rails.application.routes.draw do
  resources :groups
  resources :pages

  post 'top/send_access_token',          to: 'top#send_access_token',   as: :send_access_token
  get  'top/verify_access_token/:token', to: 'top#verify_access_token', as: :verify_access_token

  # For OmniAuth
  get "/auth/:provider/callback" => "sessions#callback"
  get "/auth/failure"            => "sessions#failure"
  get "/logout"                  => "sessions#destroy", as: :logout

  get "/my/search" => "my#search"
  get "/my/library" => "my#library"

  root to: 'top#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
