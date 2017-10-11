class OrdersController < ApplicationController

    layout false

    def new
      @shopping_cart = get_or_create_shopping_cart
      if @shopping_cart.empty?
        flash[:error] = "Add something to your cart first!"
        redirect_to products_url
      elsif current_user
        @address = current_user.address || current_user.build_address
        @order = Order.new(user: current_user, shopping_cart: @shopping_cart)
      else
        # TODO: add expiring session or cookie here
        redirect_to login_url
      end
    end

    def create
      @order = current_user.orders.build(order_params)
      @order.shopping_cart = get_shopping_cart
      @address = current_user.build_address(address_params)
      if @order.valid? and @address.valid?
        @order.save
        @address.save
        @order.send_emails_and_texts
        flush_shopping_cart
        redirect_to thank_you_url(order: @order)
      else
        flash.now[:error] = "There is something wrong with the form. Please try again."
        render :new
      end
    end

    def show
      @order = current_user.orders.where(id: params[:order]).take
      @cart = @order.shopping_cart
      @address = @order.address
    end

    private

        def order_params
          params.require(:order).permit( :delivery_date, :delivery_time)
        end

        def address_params
          params.require(:address).permit(:name, :line_1, :line_2, :area, :city, :state)
        end

        def get_shopping_cart
          cart = ShoppingCart.find(session[:cart_id])
          return cart
        end

        def flush_shopping_cart
          session.delete(:cart_id)
        end
end
