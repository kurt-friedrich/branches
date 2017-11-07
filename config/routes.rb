Rails.application.routes.draw do
  resources :companies, only: [:index]

  get 'companies/alphabetically'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
