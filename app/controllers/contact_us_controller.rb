class ContactUsController < ApplicationController
  def send_message
    begin
      name = contact_us_params[:name]
      mobile_number = contact_us_params[:mobile_number]
      email = contact_us_params[:email]
      message = contact_us_params[:message]
      ContactUsMailer.send_email_to_customer(name, mobile_number, email, message).deliver
      ContactUsMailer.send_email_to_admin(name, mobile_number, email, message).deliver
      flash[:notice] = "Your message was sent."
      puts "success"
    rescue
      puts "failure"
      flash[:error] = "Your message could not be sent. You can also write to us directly at admin@redgini.com"
    end
    redirect_to root_url
  end

  private
    def contact_us_params
      params.require(:contact_us).permit(:name, :mobile_number, :email, :message)
    end
end
