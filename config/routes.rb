Rails.application.routes.draw do
  
  root 'todolists#index'
  # get 'persons/profile', as: 'user_root'
  devise_for :users
  
  
  resources :todolists do
     resources :tasks
     put '/tasks/:id/upsort', to: 'tasks#upsort', as: 'upsort'
     put '/tasks/:id/downsort', to: 'tasks#downsort', as: 'downsort'
  end
end

