Rails.application.routes.draw do
  #get 'courses/index'

 resources :students do
  resources :enrollments, only: [:create, :destroy]
 end
 resources :courses 
  root 'welcomes#index'
end
