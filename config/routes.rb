Rails.application.routes.draw do
  
  get 'contact/index'

  get 'introduce/index'

  resources :invoicedetails

  # resources :invoices do
  #   post 'remove_project_out_invoice' => :remove_project_out_invoice
  # end
  resources :invoices do
    collection do
      post :remove_project_out_invoice
    end
  end

  resources :replies

  resources :feedbacks

  resources :procategories do
    collection do
      post :add_new_procategory
    end
  end

  resources :attachments

  resources :projects do
    collection do
      post :download_attachment
    end
  end

  namespace :admin do
    controller :users do
      get 'change_user_status' => :change_user_status
    end

    controller :projects do
      get 'change_project_share' => :change_project_share
      get 'change_project_status' => :change_project_status
    end

    controller :procategories do
      get 'change_procategory_status' => :change_procategory_status
    end

    controller :feedbacks do
      get 'change_feedback_status' => :change_feedback_status
    end

    controller :replies do
      get 'change_reply_status' => :change_reply_status
    end

    controller :invoices do
      get 'change_invoice_status' => :change_invoice_status
    end
  end

  # post "invoices/remove_project_out_invoice" => "invoices#remove_project_out_invoice"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { registrations: 'registrations' }
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
