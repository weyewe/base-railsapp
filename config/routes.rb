Rails.application.routes.draw do
  devise_for :users
  root :to => 'home#extjs' , :method => :get
  
  namespace :api do 
    devise_for :users
    post 'authenticate_auth_token', :to => 'sessions#authenticate_auth_token', :as => :authenticate_auth_token
  end
end
