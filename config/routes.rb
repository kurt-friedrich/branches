Rails.application.routes.draw do
  resources :companies, only: [:index]

  get 'companies/alphabetically'

  get 'companies/with_modern_plan'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
