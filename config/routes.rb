Rails.application.routes.draw do
  resources :doctors, only: [:show]
  resources :patients, only: [:index, :destroy]
  resources :hospitals, only: [:show]
end
