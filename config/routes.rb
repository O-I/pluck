Pluck::Application.routes.draw do
  root 'favorites#index'
  resources :favorites, only: :index
end