class MobileNumberController < ApplicationController
  layout false

  def new
  end

  def send_otp
    # TODO
    number = Random.rand(100000..1000000)
    current_user.mobile_number = params[:mobile_number]
    current_user.otp = number
    current_user.save
    render json: { otp: number }
  end

  def verify_otp
    if params[:otp] and params[:otp] == current_user.otp
      current_user.otp = nil
      current_user.otp_verified = true
      current_user.save
      flash[:notice] = "Your number has been successfully verified."
      redirect_to products_url
    else
      flash[:error] = "Your number could not be successfully verified. Please try again."
      redirect_to mobile_number_url
    end
  end

end
