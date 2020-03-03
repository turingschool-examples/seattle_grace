Rails.application.routes.draw do

  resources :surgeries, only: [:show]
end
