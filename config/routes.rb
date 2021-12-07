Rails.application.routes.draw do
  root to: 'queue_walls#index'
  resources :queue_walls, only: %i[index new create]
  get 'queue_walls/filter/:id', to: 'queue_walls#filter', as: :filter
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
