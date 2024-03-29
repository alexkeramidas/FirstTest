Rails.application.routes.draw do

  require 'api'

  root to: 'pages#home'

  devise_for :admins, controllers: { sessions: 'admins/sessions' }

  devise_for :users, controllers: { sessions: 'users/sessions' }

  devise_for :stores, controllers: { sessions: 'stores/sessions' }

  resources :admins, :only => [:show]
  resources :users, :only => [:show]
  resources :stores, :only => [:show]

  match '/about',   to: 'pages#about',   via: 'get'
  match '/contact', to: 'pages#contact', via: 'get'

  mount FirstTest::API => '/'

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
  #   namespace :admins do
  #     # Directs /admins/products/* to Admin::ProductsController
  #     # (app/controllers/admins/products_controller.rb)
  #     resources :products
  #   end

end
