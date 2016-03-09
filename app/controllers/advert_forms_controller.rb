class AdvertFormsController < ApplicationController
  def create
    @advert_form = AdvertForm.new(advert_form_params)
    if @advert_form.save
      RequestMailer.request_mail(@advert_form).deliver
      @back_url = params[:back_url][5..-1]
      render 'success'
    end

  end

  private
    def advert_form_params
      params.require(:advert_form).permit(
      :company_title, :address, :advice, :layout, :name,
      :phone, :email, :photo, :logo)
    end
end
