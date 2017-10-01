class SessionsController < ApplicationController

  layout false, except: :create

  def new
  end

  def create
    # begin
      @user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_id] = @user.id
    # rescue
    # end
    if @user.mobile_number.blank?
      redirect_to mobile_number_url
    else
      redirect_to products_url
    end
  end

  def destroy
    if current_user
      session.delete(:user_id)
    end
    redirect_to root_url
  end

end
