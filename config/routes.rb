Rails.application.routes.draw do
  
  root 'todolists#index'
  devise_for :users
  resources :todolists do
    resources :tasks 
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

