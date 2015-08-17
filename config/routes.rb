Rails.application.routes.draw do
  root 'homepage#index'

  constraints :subdomain => "admin" do
    scope :module => 'hzadmin' do
      resources :builders do
        resources :apartments  
      end
      resources :designs
    end
  end
  
  resources :builders
  resources :apartments, only: [:index, :show] do
    resources :flats, only: [:show]
  end
end
