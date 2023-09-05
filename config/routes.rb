Rails.application.routes.draw do

  resources :recipes do
    resources :ingredients
  end
  resources :foods
  get 'public_recipes', to: 'recipes#public_recipes'
  root 'home#index'
  devise_for :users
end
