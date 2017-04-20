Rails.application.routes.draw do

  devise_for :customers, controllers: {registrations: "registrations"}

  get "shoppingcart" => "shoppingcart#show"
  get "shoppingcart/add/:id" => "shoppingcart#add", :as => :add_to_shoppingcart
  post "shoppingcart/remove/:id" => "shoppingcart#remove", :as => :remove_from_shoppingcart
  post "shoppingcart/checkout" => "shoppingcart#checkout", :as => :checkout
  post "shoppingcart/update/:id" => "shoppingcart#update", :as => :order_items_update

  get 'pages/index'
  get 'pages/details/:id', :to => 'pages#details', :as => :details

  get 'pages/alphabetized'

  # root to: 'finder#index'
  # resources :finder, path: '/customers', only: [:index]
  # changed to view products instead
  # views/pages/index.html.slim using _product.html.slim partial
  # --------------------------------
  root to: 'pages#index'

  resources :pages #, path: '/pages', only: [:index]

  # resources :customers do
  #   get 'alphabetized' => 'finder#alphabetized', on: :collection
  #
  #   get 'missing_email' => 'finder#missing_email', on: :collection
  # end

  resources :products do
    get 'alphabetized' => 'pages#alphabetized', on: :collection
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
