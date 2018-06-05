Rails.application.routes.draw do
  devise_for :users
  resources :users, except: [:new, :create]

  root :to => 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
