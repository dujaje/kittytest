Rails.application.routes.draw do
  root to: 'pages#home'
  get 'redirect', to: 'pages#mobile_home', as: 'mobile_redirect'

  get 'webhooks', to: 'webhooks#messenger'
  post 'webhooks', to: 'webhooks#receive_message'

  namespace :extension do
    get 'welcome', to: 'pages#redirect'
    get 'create_kitty', to: 'pages#create_kitty'
    get 'info', to: 'pages#info'
    resources :groups, only: [:show, :update]
    resources :expenses, only: [:new, :create, :show]
    resources :charges, only: [:new, :create]
    get 'settle', to: 'expenses#settle'
    resources :users, only: [:show]
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [ :create ]
    end
  end
end
