class RequestMailer < ActionMailer::Base
  default from: Rails.application.secrets.email_provider_username

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.request_mailer.request.subject
  #
  def request_mail(advert_form)
    @advert_form = advert_form

    mail to: Rails.application.secrets.requests_send_to, subject: "запит від #{@advert_form.company_title}"
  end
end
