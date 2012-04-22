DubLeds::Application.routes.draw do
  # Mount Spree's routes
  mount Spree::Core::Engine, :at => '/store'

  resources :medias
  resources :refunds
  resources :privacies
  resources :products, :only => [ :index ]

  # Routes for Devise
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_scope :user do
    get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  end

	get '/users/:id(:format)'  => 'users#show', :as => :user

  # Resources
  resources :newsletters
  resources :contact
  resources :users
  resources :authentications

  # match '/users/auth/:provider/callback' => 'authentications#create'
  #   get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  # match '/registrations' => 'registrations#email'

  match '/rims/image_cache'   => 'rims#image_cache', :constraints => { :cache_id => /\d{8}-\d{4}-\d{5}-\d{4}/, :filename => /[a-zA-Z0-9_ ]+\.(jpg|jpeg|png|gif){1}/i }
  match "/tmp/uploads/*path"  => "gridfs#serve"

  # match '/signin' => 'sessions#new', :as => :signin
  #
  match '/users/sign_out'     => 'sessions#destroy', :as => :signout
  post '/cookie' => 'cookies#create'


  # Administration Routes
  namespace :admin do
    resources :rims, :resources, :medias, :newsletters
  end

  get '/home'                => 'home#index',       :as => :home
  get '/admin'               => 'admin#index',      :as => :admin
  get '/media'               => 'media#index',    :as => :media
  #   get '/media/new'           => 'medias#new',      :as => :media_new
  #   get '/media/:id'           => 'medias#show',     :as => :media_show
  #   get '/media/:id/edit'      => 'medias#edit',     :as => :media_edit
  #   put '/media/:id'           => 'medias#update',   :as => :media_update
  #   post '/media/create'       => 'medias#create',   :as => :media_create
  #   delete '/media/:id'        => 'medias#destroy',  :as => :media_destroy

  get '/contact'             => 'contact#index',    :as => :contact
  get '/contact/new'         => 'contact#new',      :as => :contact_new
  get '/contact/:id'         => 'contact#show',     :as => :contact_show
  get '/contact/:id/edit'    => 'contact#edit',     :as => :contact_edit
  put '/contact/:id'         => 'contact#update',   :as => :contact_update
  post '/contact/create'     => 'contact#create',   :as => :contact_create
  delete '/contact:id'       => 'contact#destroy',  :as => :contact_destroy

  get '/privacy_policy'      => 'privacies#index',  :as => :privacy_policy
  get '/refund_policy'       => 'refunds#index',    :as => :refund_policy

  get '/generator'           => 'generator#index',  :as => :generator
  get '/store'               => 'store#index',      :as => :store
  get '/technology'          => 'technology#index', :as => :technology

  get '/technology/:title'   => 'technology#show',   :as => :technology_show

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'

  root :to => 'home#index'

end
