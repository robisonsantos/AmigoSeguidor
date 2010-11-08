Amigoseguidor::Application.routes.draw do
  root :to => "home#index"
    
  devise_for :users do
    get "sign_in",  :to => "devise/sessions#new"
    get "sign_out", :to => "devise/sessions#destroy"
  end
  
  namespace :user do
    root :to => "users#index"
  end

  resources :messages, :only => [:index, :show, :new, :create, :destroy]
  resources :groups
  resources :wishlists

  ## Routes to add/edit itens of a list
  get  "add_item"    => "wishlists#new_item"
  post "add_item"    => "wishlists#create_item"
  get  "edit_item"   => "wishlists#edit_item"
  post "edit_item"   => "wishlists#update_item"
  get  "remove_item" => "wishlists#destroy_item"

  ## Secret friend
  match "/secret/:id" => "groups#secret_friend"

  match "/send_invitation" => "groups#send_invitation"
  match "/new_invitation/:id" => "groups#new_invitation"

  match "/privategroup" => "groups#privategroup"
end
