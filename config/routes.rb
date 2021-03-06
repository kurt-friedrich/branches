Rails.application.routes.draw do
  resources :companies, only: [:index]

  get 'companies/alphabetically'

  get 'companies/with_modern_plan'

  get 'companies/not_trialing'

  get 'companies/created_last_month'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
