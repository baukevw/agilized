Rails.application.routes.draw do

  devise_for :users, controllers: {
      :omniauth_callbacks => "user/omniauth_callbacks"
  }

  resources :projects

  authenticated :user do
    root 'projects#index', as: :authenticated_root
  end

  root 'application#root'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
