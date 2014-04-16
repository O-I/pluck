Pluck::Application.routes.draw do
  root 'favorites#index'
  get 'favorites/index'
  get 'favorites/show'
end
