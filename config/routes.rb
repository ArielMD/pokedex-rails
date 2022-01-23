Rails.application.routes.draw do
  namespace :api do
    resources :pokedex, only: %i[create]
  end

  resources :pokedex, only: %i[index show]
end
