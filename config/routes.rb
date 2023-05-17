Rails.application.routes.draw do
  devise_for :users
  
  root to: 'posts#index'

  resources :posts do 
    resources :comments
  end 

  get 'about', to: 'static#about'
  get 'contact', to: 'static#contact'
end
