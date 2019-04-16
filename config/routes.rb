Rails.application.routes.draw do
  resources :sites
  
  devise_for :users
  as :user do 
  get "signin" => "devise/sessions#new"
  delete "logout" => "devise/sessions#destroy"
  get "signup" => "devise/registrations#new"
  root "devise/sessions#new"
  
  end



end
