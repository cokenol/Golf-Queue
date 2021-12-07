Rails.application.routes.draw do
  root to: 'queue_walls#index'
  resources :queue_walls, only: %i[index new create]
  resources :playwall_posts, only: %i[index new create]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
