Rails.application.routes.draw do
  # Active admin
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :stocks
  resources :transactions

  # rename devise routes
  devise_for :users,
    :path => '', 
    :path_names => { 
      :sign_in => "sign_in",
      :edit => "edit_user",
      :sign_out => "logout", 
      :sign_up => "sign_up" }

  


  # HOME PAGE
  root "home#index" # Set home/index as root
  get "about", to: "home#about"

  # MARKET
  get '/market', to: "market#index"
  # post '/market' => "market#index"
  post 'search_stock_in_market' => "market#search_stock_in_market"
  post "add_stock_to_market" => "market#add_stock_to_market"
end
