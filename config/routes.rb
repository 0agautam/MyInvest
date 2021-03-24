Rails.application.routes.draw do
  
  root "stocks#index"

  resources :stocks do
    collection do
      get 'balance'
      get 'history'
      get 'holding'
    end
  end

  resources :stocks
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
