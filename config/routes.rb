# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'cocktails#index'
  resources :ingredients
  resources :cocktails do
    resources :doses
  end
end
