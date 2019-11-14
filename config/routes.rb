# frozen_string_literal: true

Rails.application.routes.draw do
  resources :ingredients
  resources :cocktails
  # resources :doses
  # get  '/cocktails/:cocktail_id/doses' to: 'doses#index'
  get '/cocktails/:cocktail_id/doses', to: 'doses#index', as: :doses
  get '/cocktails/:cocktail_id/doses/new', to: 'doses#new', as: :new_dose
  post '/cocktails/:cocktail_id/doses', to: 'doses#create'
  delete '/doses/:id', to: 'doses#destroy'
  get '/doses/:id', to: 'doses#show', as: :dose
  get '/doses/:id/edit', to: 'doses#edit', as: :edit_dose
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
