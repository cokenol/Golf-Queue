Rails.application.routes.draw do
  delete '/friends/:id', to: 'friendlists#delete_friend', as: 'delete_friend'
  post '/friends/block/:id', to: 'friendlists#block_friend', as: 'block_friend'
  post '/friends/unblock/:id', to: 'friendlists#unblock_friend', as: 'unblock_friend'
  get '/friends', to: 'friendlists#friends_list', as: 'friends'
  get '/friends/search', to: 'friendlists#search_friend', as: 'search_friends'
  get '/friends/add/:id', to: 'friendlists#add_friend', as: 'add_friend'
  get '/friends/accept/:id', to: 'friendlists#accept_friend', as: 'accept_friend'
  get '/friends/decline/:id', to: 'friendlists#decline_friend', as: 'decline_friend'
  root to: 'queue_walls#index'

  resources :status_updates, only: %i[index new]
  post '/status_updates', to: 'status_updates#create', as: 'create_status'
  delete '/status_updates/:id', to: 'status_updates#delete', as: 'delete_status'
  resources :golf_ranges do
    resources :queue_walls, only: %i[new create]
  end
  resources :notifications, only: %i[index]
  resources :queue_walls, only: %i[index] do
    resource :queue_wall_reports, only: %i[new create]
    member do
      post 'toggle_vote', to: "queue_walls#toggle_votes"
    end
  end
  resources :playwall_posts, only: %i[index new create show] do
    resources :comments, only: %i[index new show create]
    resources :play_wall_reports, only: %i[new create]
    member do
      post 'toggle_favorite', to: "playwall_posts#toggle_favorite"
      # get 'userplaywall', to: "playwall_posts#userplaywall"
    end

  end
  get 'userpost', to: 'pages#userpost'
  resources :golf_ranges, only: %i[show]
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
