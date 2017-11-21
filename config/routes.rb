Rails.application.routes.draw do
  root to: 'pages#home'

  get 'webhooks', to: 'webhooks#messenger'
  post 'webhooks', to: 'webhooks#receive_message'

  namespace :extension do
     get 'welcome', to: 'pages#home'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
