Rails.application.routes.draw do

  devise_for :users, controllers: {
      :omniauth_callbacks => "user/omniauth_callbacks"
  }

  authenticated :user do
    root 'projects#index', as: :authenticated_root
  end

  root 'pages#landing'

  resources :projects
  resources :teams

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
