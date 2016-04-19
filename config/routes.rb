Rails.application.routes.draw do




  get 'markers', to: 'main#markers'

  post 'donate', to: 'donate#index', as: :donate
  post 'donate/callback/:id', to: 'donate#callback', as: :donate_callback

  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  resource :advert_form, only: :create
  scope (":locale"), locale: /#{I18n.available_locales.join("|")}/ do
    root to: 'main#index'
    resources :news, only: [:index, :show]
    resources :publications, only: [:index]
    get 'projects/:slug', to: 'projects#show', as: :project
    get 'projects/:slug/news', to: 'projects#show_news', as: :project_news
    get 'faq', to: 'faq#show', as: :faq
    get 'partners', to: 'media_partners#index', as: :partners
  end
   root to: redirect("/#{I18n.locale}", status: 302), as: :redirected_root
   get "/*path", to: redirect("/#{I18n.default_locale}/%{path}", status: 302),
    constraints: {path: /(?!(#{I18n.available_locales.join("|")})\/).*/}, format: false
end
