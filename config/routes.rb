Rails.application.routes.draw do
  get 'golf_ranges/show'
  root to: 'queue_walls#index'
  resources :golf_ranges do
    resources :queue_walls, only: %i[new create]
  end
  resources :queue_walls, only: %i[index]
  resources :playwall_posts, only: %i[index new create]
  resources :golf_ranges, only: %i[show]

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
