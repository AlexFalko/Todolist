Rails.application.routes.draw do
  
  root 'todolists#index'
  # get 'persons/profile', as: 'user_root'
  devise_for :users
  
  
  resources :todolists do
     resources :tasks 
    end
end

