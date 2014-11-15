module LangSwitcherHelper

  def change_locale_for_params(locale)
    #= request.original_url
    new_params = Marshal.load(Marshal.dump(request.query_parameters))
    new_params[:locale] = locale
    new_params
  end

end
