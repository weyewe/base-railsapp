Rails.application.routes.draw do
  root :to => 'home#extjs' , :method => :get
  
  namespace :api do 
  end
end
