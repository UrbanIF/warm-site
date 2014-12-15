Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  scope ':locale', locale: /uk|en/ do
    root to: 'home#index'
  end

  root to: redirect("/#{I18n.locale}", status: 302), as: :redirected_root
end
