Rails.application.routes.draw do


  root 'homepage#index'

  resources :builders, only: [:index, :show]
  resources :apartments, only: [:index, :show] do
	resources :flats, only: [:show]
  end

end
