Rails.application.routes.draw do
  get 'publications/index'


  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
    root to: 'main#index'
    resources :news, only: [:index, :show]
    resources :publications, only: [:index]
  end    
   root to: redirect("/#{I18n.locale}", status: 302), as: :redirected_root
end
