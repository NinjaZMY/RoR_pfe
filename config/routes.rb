Rails.application.routes.draw do
  resources :sites
  
  devise_for :users
  as :user do 
  get "signin" => "devise/sessions#new"
  delete "logout" => "devise/sessions#destroy"
  get "signup" => "devise/registrations#new"
  
  end
  get "home1" => "sites#home1"
  get "home2" => "sites#home2"
  get "home3" => "sites#home3"
  get "home4" => "sites#home4"
  get "sites" => "sites#new"
  root "sites#new"
  get "scrap" => "sites#Scrap"
  post "scrap" => "sites#Scrap"
  get "connexion" => "sites#connexion"
  get "move" => "sites#move"
end
