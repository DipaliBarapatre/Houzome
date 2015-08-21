Rails.application.routes.draw do
  constraints :subdomain => "admin" do
    scope :module => 'hzadmin' do
      resources :builders do
        resources :apartments  do
          resources :flats, :towers
        end
      end
      resources :designs
    end
    get '/' => 'hzadmin/builders#index'
  end
  
  resources :builders, as: :frontend_builders
  resources :apartments, only: [:index, :show] do
    resources :flats, only: [:show]
  end

  scope 'api', module: 'api' do
    resources :apartments, only: [:index, :show] do
      resources :designs, only: [:index]
    end
  end

  root 'homepage#index'
end