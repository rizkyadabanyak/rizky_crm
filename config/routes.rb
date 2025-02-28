Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check


  # Defines the root path route ("/")
  root "user#login"
  get "login", to: "user#login", as: "login"
  post "/register-login",to: "user#actionLogin",as: "action_login"

  
  get "/testing",to: "user#index"
  get "/register",to: "user#register",as: "register"

  post "/register-action",to: "user#actionRegister",as: "action_register"

  get "/logout-action",to: "user#logout",as: "action_logout"

  get "dashboard",to: "dashboard#index",as: "dashboard"

  get "potential-customer/create",to: "potential_customers#create",as: "potential_customer_create"
  post "potential-customer/create-action",to: "potential_customers#create_action",as: "potential_customer_create_action"
  delete "potential-customer/delete-action/:id",to: "potential_customers#delete_action",as: "potential_customer_delete_action"
  get "potential-customer/edit/:id",to: "potential_customers#edit",as: "potential_customer_edit"
  put "potential-customer/edit-action/:id",to: "potential_customers#edit_action",as: "potential_customer_edit_action"




  get "products",to: "products#index",as: "products"
  get "products/create",to: "products#create",as: "products_create"
  post "products/create-action",to: "products#create_action",as: "products_create_action"
  delete "products/delete-action/:id",to: "products#delete_action",as: "products_delete_action"
  get "products/edit/:id",to: "products#edit",as: "products_edit"
  put "products/edit-action/:id",to: "products#edit_action",as: "products_edit_action"


  get "customers",to: "customers#index",as: "customers"
  post "customers/transaction-action",to: "customers#transaction_action",as: "customers_transaction"
  delete "customers/transaction-delete-action/:id",to: "customers#delete_action",as: "customers_delete_action"
  post "customers/transaction-aprove-action/:id",to: "customers#aprove_action",as: "customers_aprove_action"

  # get "/products", to: "products#index"
  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

end
