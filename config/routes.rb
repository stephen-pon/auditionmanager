Rails.application.routes.draw do

  post 'preferences/show', to: 'preferences#add_auditionee'
  put 'preferences/show', to: 'preferences#remove_auditionee'
  resources :directors
  resources :rosters
  resources :preferences

  resources :sessions

  put 'casting_groups/index', to: 'casting_groups#add_video', as: 'add_video'
  put 'casting_groups/index', to: 'casting_groups#remove_video', as: 'remove_video'
  post 'casting_groups/show', to: 'casting_groups#add_auditionee'
  put 'casting_groups/show', to: 'casting_groups#remove_auditionee', as: 'remove_auditionee'
  resources :casting_groups 
  get 'casting_groups/index'

  post '/auditionees/remove_ungrouped', to: 'auditionees#remove_ungrouped', as: 'remove_ungrouped'
  get '/auditionees/search', to: 'auditionees#search'
  resources :auditionees

  get 'welcome/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
