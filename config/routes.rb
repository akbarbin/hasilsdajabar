Hasilsda::Application.routes.draw do
  devise_for :users

  resources :payments


  resources :bergains


  resources :orders


  resources :posts


  resources :users


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

  namespace :admin do
    resources :dashboards, :only => [:index]
    resources :users
    resources :payments
  end

  namespace :seller do
    resources :dashboards
    resources :posts
    resources :bergains
    resources :orders
  end

  namespace :wholeseller do
    resources :dashboards
    resources :posts do
      collection do
        get :berganing_product_price
        get :finish_transaction
        get :finish_bergaining
        get :my_post
        post :save_berganing
      end
    end
    resources :bergains
    resources :payments do
      collection do
        get :confirm_payment
        post :save_confirm_payment
      end
    end
    resources :orders do
      member do
        get :add_order
        get :method_payment
        get :finish_transaction
        put :update_method_payment
        post :add_to_order
      end
    end
    resources :bergains
  end

  namespace :buyer do
    resources :dashboards
    resources :posts do
      collection do
        get :finish_transaction
        post :save_berganing
      end
    end
    resources :bergains
    resources :payments do
      collection do
        get :confirm_payment
        post :save_confirm_payment
      end
    end
    resources :orders do
      member do
        get :add_order
        get :method_payment
        get :finish_transaction
        put :update_method_payment
        post :add_to_order
      end
    end
    resources :bergains
  end

  resources :home do
    collection do
      get :search
      get :about
    end
  end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end