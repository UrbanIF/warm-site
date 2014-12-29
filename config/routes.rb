Rails.application.routes.draw do
  get 'media_partners/index'

  get 'faq/show'

  get 'projects/show'

  get 'publications/index'


  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  scope (":locale"), locale: /#{I18n.available_locales.join("|")}/ do
    root to: 'main#index'
    resources :news, only: [:index, :show]
    resources :publications, only: [:index]
    get 'projects/:slug', to: 'projects#show', as: :project
    get 'faq', to: 'faq#show', as: :faq
    get 'partners', to: 'media_partners#index', as: :partners
  end
   root to: redirect("/#{I18n.locale}", status: 302), as: :redirected_root
end
