Rails.application.routes.draw do
  constraints :subdomain => "admin" do
    scope :module => 'hzadmin' do
      resources :builders do
        resources :apartments  do
          resources :flats, :towers
        end
      end
      resources :designs
      resources :orders
      resources :customers
      resources :sessions
    end
    get '/' => 'hzadmin/builders#index'
  end

  match "/blog" => redirect("http://houzome.wordpress.com"), :as => :blog, via: [:get]

  
  devise_for :users
  resources :builders, as: :frontend_builders
  resources :apartments, only: [:index, :show]
  resources :designs, only: [:show]
  resources :orders, only: [:create]
  get 'custom/design' => 'custom#design'
  post 'custom/design' => 'custom#create'

  scope 'api', module: 'api' do
    resources :apartments, only: [:index, :show] do
      resources :designs, only: [:index]
    end
  end

  root 'homepage#index'
end