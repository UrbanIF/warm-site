class DonateController < ApplicationController

  def index
    expires_now
    if request_id = save_request
      base = prepare_request_params(request_id)
      url = "https://www.liqpay.com/api/checkout"
      url += "?data=#{ URI::encode( base ) }"
      url += "&signature=#{  signature( base ) }"

      # render text: url
      redirect_to url
    end

  end

  def callback
    if signature_valid?( params[:signature], params[:data] )
      data = decoded_data
      donation = Donation.find(params[:id])
      donation.paid_at = Time.now
      donation.paid_sum = data['amount']
      donation.paid_status = data['status']
      donation.paid_order_id = data['order_id']
      donation.paid_transaction_id = data['transaction_id']
      donation.save
    end
    render nothing: true
  end

  protected
  def save_request
    donation = Donation.new ({
      email: params[:email],
      name: params[:name],
      amount: params[:amount],
      success: false
      })

    donation.save

    donation.id
  end

  def prepare_request_params(request_id)
    request_json = {
      version: 3,
      public_key: Liqpay.config.public_key,
      amount: params[:amount].to_i,
      currency: 'UAH',
      description: "Dobrovilna pozhertva",
      language: I18n.locale == :en ? 'en' : 'ru',
      type: 'donate',
      order_id: order_id(request_id),
      server_url: donate_callback_url(request_id),
      result_url: root_url,
      # sandbox: 1
      sandbox: Rails.env.production? ? 0 : 1
    }
    json = JSON.generate( request_json )
    json = Iconv.conv('utf-8', 'Windows-1251', json)
    [json].pack("m")
  end

  def order_id(request_id)
    "#{request_id.to_s}-#{Time.now.to_s.parameterize}"
  end

  def signature_valid?(recieved_signature, recieved_data)
    signature(recieved_data) == recieved_signature
  end

  def decoded_data
    data = Base64.decode64( params[:data] )
    JSON.parse( data )
  end

  def signature(data)
    #  urlsafe_encode64(str)
    key = Liqpay.config.private_key + data + Liqpay.config.private_key
    key = Digest::SHA1.digest( key )
    [key].pack("m")
    #  Base64.urlsafe_encode64( key )
  end
end
