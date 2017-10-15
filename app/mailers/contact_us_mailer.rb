class ContactUsMailer < ApplicationMailer
  default from: 'admin@redgini.com'

  def send_email_to_customer(name, mobile_number, email, message)
    @name = name
    @mobile_number = mobile_number
    @email = email
    @message = message
    mail to: @email, subject: 'Redgini team has received your message'
  end

  def send_email_to_admin(name, mobile_number, email, message)
    @name = name
    @mobile_number = mobile_number
    @email = email
    @message = message
    mail to: 'admin@redgini.com', subject: 'New Message from contact us form'
  end

end
