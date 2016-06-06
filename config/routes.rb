Rails.application.routes.draw do
  
  resources :c_messages
  resources :b_messages
  resources :a_messages
  resources :spanish_messages
  resources :histories
  resources :messages
  resources :users
  root 'users#index'
  
  devise_for :admins, :controllers => { :registrations => "registrations" }

  post 'user/reply' => 'users#reply'
end
