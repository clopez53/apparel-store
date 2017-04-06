Rails.application.routes.draw do
  root to: 'finder#index'

  resources :finder, path: '/customers', only: [:index]

  resources :customers do
    get 'alphabetized' => 'finder#alphabetized', on: :collection

    get 'missing_email' => 'finder#missing_email', on: :collection
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
