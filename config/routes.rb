Rails.application.routes.draw do
  devise_for :users
  root :to => 'home#extjs' , :method => :get
  
  namespace :api do 
  end
end
