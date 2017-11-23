Rails.application.routes.draw do
  root to: 'pages#home'

  get 'webhooks', to: 'webhooks#messenger'
  post 'webhooks', to: 'webhooks#receive_message'

  namespace :extension do
    get 'welcome', to: 'pages#redirect'
    get 'create_kitty', to: 'pages#create_kitty'
    resources :groups, only: [:show]
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [ :create ]
    end
  end
end
