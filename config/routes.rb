Rails.application.routes.draw do
  resources :users
  get 'health_check', to: 'application#health_check'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
