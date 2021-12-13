Rails.application.routes.draw do
  delete '/friends/:id', to: 'friendlists#delete_friend', as: 'delete_friend'
  get '/friends', to: 'friendlists#friends_list', as: 'friends'
  root to: 'queue_walls#index'

  resources :golf_ranges do
    resources :queue_walls, only: %i[new create]
  end
  resources :queue_walls, only: %i[index] do
    resource :queue_wall_reports, only: %i[new create]
    member do
      post 'toggle_vote', to: "queue_walls#toggle_votes"
    end
  end
  resources :playwall_posts, only: %i[index new create] do
    resources :comments, only: %i[index new show create]
    resources :play_wall_reports, only: %i[new create]
    member do
      post 'toggle_favorite', to: "playwall_posts#toggle_favorite"
    end
  end

  resources :golf_ranges, only: %i[show]
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
