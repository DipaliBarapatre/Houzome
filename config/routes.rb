Rails.application.routes.draw do
  constraints :subdomain => "admin" do
    scope :module => 'hzadmin' do
      resources :builders do
        resources :apartments  do
          member do 
            post 'active'
            post 'inactive'
          end
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

  ## Authentication
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  
  ## Dashboard
  scope :module => 'dashboard' do
    resources :orders, only: [:index, :show]
  end

  resources :builders, as: :frontend_builders
  resources :apartments, only: [:index, :show]
  resources :designs, only: [:show], as: :frontend_designs
  resources :orders, only: [:create]
  get 'custom/design' => 'custom#design'
  post 'custom/design' => 'custom#create'

  scope 'api', module: 'api' do
    resources :apartments, only: [:index, :show] do
      resources :designs, only: [:index]
    end
  end

  get "sitemap.xml" => "homepage#sitemap", format: :xml, as: :sitemap
  get "robots.txt" => "homepage#robots", format: :text, as: :robots

  root 'welcome#index'
  
  get "home" => "homepage#index"
end