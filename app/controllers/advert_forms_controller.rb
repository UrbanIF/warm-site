class AdvertFormsController < ApplicationController
  def create
    @advert_form = AdvertForm.new(advert_form_params)
    @back_url = params.fetch(:back_url,'').gsub(/http:/, '')
    if @advert_form.save
      RequestMailer.request_mail(@advert_form).deliver
      render 'success'
    end

  end

  private
    def advert_form_params
      params.require(:advert_form).permit(
      :company_title, :address, :advice, :layout, :name,
      :phone, :email, :photo, :photo_cache, :logo, :logo_cache)
    end
end
