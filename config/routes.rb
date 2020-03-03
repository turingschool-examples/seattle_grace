Rails.application.routes.draw do
  resources :surgeries, only: [:show]
  patch '/surgeries/:id', to: 'surgeries#update_doctors'
end
