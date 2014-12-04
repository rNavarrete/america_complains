require 'resque/server'
# Of course, you need to substitute your application name here, a block
# like this probably already exists.
SocialMobility::Application.routes.draw do
  mount Resque::Server.new, at: "/resque"
end


Rails.application.routes.draw do

  root "complaints#index"

  resources :complaints

  resources :businesses

  resources :users
  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out


  get '/auth/twitter/callback', to: 'sessions#create'

  namespace :admin do
    get "update_database"   =>   "database#update_data", as: :update_data
    get "update_businesses" => "database#update_businesses"
    get "update_yelp_ids"   => "database#update_yelp_ids"
    get "update_yelp_ids"   => "database#update_yelp_ids"
  end


  namespace :api do
    namespace :v1 do
      resources :complaints
    end
  end

  match "/404" => "errors#error404", via: [ :get, :post, :patch, :delete ]



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
