Rails.application.routes.draw do
  root 'homepage#index'

  resources :builders, only: :index
end
