class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :layout_by_resource
  before_action :set_locale

  def set_locale(locale = I18n.default_locale)
    I18n.locale = params[:locale] || locale
  end

  def default_url_options(options={})
    { locale: I18n.locale }
  end

  protected

    def layout_by_resource
      if devise_controller?
        "application_device"
      else
        "application"
      end
    end
end
