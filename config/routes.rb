Rails.application.routes.draw do
  get 'golf_ranges/show'
  root to: 'queue_walls#index'
  resources :queue_walls, only: %i[index new create] do
    member do
      post 'toggle_vote', to: "queue_walls#toggle_votes"
    end
  end
  resources :playwall_posts, only: %i[index new create] do
    member do
      post 'toggle_favorite', to: "playwall_posts#toggle_favorite"
    end
  end
  resources :golf_ranges, only: %i[show]

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
