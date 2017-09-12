class SessionsController < ApplicationController
  
  def new
  end

  def create
    begin
      @user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_id] = @user.id
    rescue
    end
    redirect_to :back or root_url
  end

  def destroy
    if current_user
      session.delete(:user_id)
    end
    redirect_to :back or root_url
  end

end
