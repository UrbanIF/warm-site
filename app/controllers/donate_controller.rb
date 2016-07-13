class DonateController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:liqpay_callback, :wayforpay_callback]

  def index
    expires_now
    donation = save_donation
    redirect_to donate_show_path(donation) if donation
  end

  def show
    @donation = Donation.find(params[:id])
    redirect_to root_url if @donation.success?
    base = prepare_liqpay_request_params(@donation)
    @liqpay_url = 'https://www.liqpay.com/api/checkout' \
                  "?data=#{URI.encode(base)}" \
                  "&signature=#{signature(base)}"
    @wayforpay_url = 'https://secure.wayforpay.com/pay'
    @wayforpay_params = prepare_wayforpay_request_params(@donation)
  end

  def liqpay_callback
    if signature_valid?(params[:signature], params[:data])
      data = decoded_data
      donation = Donation.find(params[:id])
      donation.paid_at = Time.current
      donation.paid_sum = data['amount']
      donation.paid_status = data['status']
      donation.paid_order_id = data['order_id']
      donation.paid_transaction_id = data['transaction_id']
      donation.save
    end
    logger.fatal "invalid signature: #{params[:signature]}, #{params[:data]}"
    render nothing: true
  end

  def wayforpay_callback
    data = JSON.parse(request.raw_post)

    donation = Donation.find(params[:id])
    donation.paid_at = Time.current
    donation.paid_status = data['transactionStatus']
    donation.paid_sum = data['amount']
    donation.paid_order_id = data['orderReference']
    donation.success = true if data['transactionStatus'] == 'Approved'

    donation.save

    resp = { orderReference: data['orderReference'],
             status: 'accept',
             time: Time.current.to_i
           }

    resp[:signature] = create_hmac_md5(resp.values.join(';'))
    render json: resp
  end

  protected

  def save_donation
    donation = Donation.create(
      email: params[:email],
      name: params[:name],
      amount: params[:amount],
      success: false
    )
    donation
  end

  def prepare_liqpay_request_params(donation)
    request_json = {
      version: 3,
      public_key: Liqpay.config.public_key,
      amount: donation.amount,
      currency: 'UAH',
      description: 'Dobrovilna pozhertva',
      language: I18n.locale == :en ? 'en' : 'ru',
      type: 'donate',
      order_id: order_id(donation.id),
      server_url: liqpay_donate_callback_url(donation.id),
      result_url: root_url,
      # sandbox: 1
      sandbox: Rails.env.production? ? 0 : 1
    }
    json = JSON.generate(request_json)
    json = Iconv.conv('utf-8', 'Windows-1251', json)
    [json].pack('m')
  end

  def prepare_wayforpay_request_params(donation)
    params = { merchantAccount: Wayforpay::WAYFORPAY_MERCHANT_ACCOUNT,
               merchantDomainName: request.domain,
               merchantAuthType: 'SimpleSignature',
               merchantTransactionSecureType: 'AUTO',
               merchantSignature: '',
               returnUrl: root_url,
               serviceUrl: wayforpay_donate_callback_url(donation.id),
               orderReference: order_id(donation.id),
               orderDate: Time.current.to_i,
               amount: donation.amount,
               currency: 'UAH',
               productName: ['Dobrovilna pozhertva'],
               productPrice: [donation.amount],
               productCount: [1]
    }

    params[:merchantSignature] = wayforpay_signature(params)

    params
  end

  def wayforpay_signature(params)
    signature = [params[:merchantAccount],
                 params[:merchantDomainName],
                 params[:orderReference],
                 params[:orderDate],
                 params[:amount],
                 params[:currency],
                 params[:productName][0],
                 params[:productCount][0],
                 params[:productPrice][0]
                ].join(';')

    create_hmac_md5(signature)
  end

  def create_hmac_md5(signature)
    OpenSSL::HMAC.hexdigest(OpenSSL::Digest::MD5.new,
                            Wayforpay::WAYFORPAY_MERCHANT_SECRET_KEY,
                            signature)
  end

  def order_id(request_id)
    "#{request_id}-#{Time.current.to_s.parameterize}"
  end

  def signature_valid?(recieved_signature, recieved_data)
    signature(recieved_data) == recieved_signature
  end

  def decoded_data
    data = Base64.decode64(params[:data])
    JSON.parse(data)
  end

  def signature(data)
    #  urlsafe_encode64(str)
    key = Liqpay.config.private_key + data + Liqpay.config.private_key
    key = Digest::SHA1.digest(key)
    [key].pack('m').strip
    #  Base64.urlsafe_encode64( key )
  end
end
