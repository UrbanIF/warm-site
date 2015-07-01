Liqpay.configure do |config|
  config.public_key = Rails.application.secrets.liqpay_public_key
  config.private_key = Rails.application.secrets.liqpay_private_key
end
