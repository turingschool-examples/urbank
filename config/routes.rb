Rails.application.routes.draw do
  root 'home#show'

  resources :accounts,  only:   %i(show)
  resources :transfers, except: %i(update edit destroy)
end
