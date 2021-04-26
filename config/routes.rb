Rails.application.routes.draw do
  
  #stocks and transaction models
  resources :stocks, only: [:index, :destroy]
  resources :transactions, only: [:index]

  # Active admin
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
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
  post 'show_stock_in_modal' => "market#show_stock_in_modal"
  post 'search_stock_in_market' => "market#search_stock_in_market"
  post "add_stock_to_market" => "market#add_stock_to_market"

  # MARKET_STOCKS
  # Contains routes for updating stocks and transactions from the marketpage - For Brokers
  resources :market_stocks, only: [:create, :destroy]

  # broker page
  resources :brokers, only: [:index, :show]
  # get "broker", to: "brokers#index"
end
