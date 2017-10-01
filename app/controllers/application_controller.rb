class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :get_or_create_shopping_cart

  private
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end
    
    def logged_in?
      return !!session[:user_id]
    end
    
    def get_or_create_shopping_cart
       if session[:cart_id] and ShoppingCart.exists?(session[:cart_id])
           return ShoppingCart.find(session[:cart_id])
       else
          cart = ShoppingCart.create
          session[:cart_id] = cart.id
          return cart
       end
    end
end
