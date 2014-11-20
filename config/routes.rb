Rails.application.routes.draw do
  get 'publications/index'

  root to: 'main#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
    resources :news, only: [:index, :show]
    resources :publications, only: [:index]
  end
end
