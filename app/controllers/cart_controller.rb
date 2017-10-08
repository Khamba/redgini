class CartController < ApplicationController
    layout false

    def show
       @cart = get_or_create_shopping_cart
       @line_item = @cart.line_items
    end

    def add
        @cart = get_or_create_shopping_cart
        @cart.add(params[:product_id], params[:quantity])
        flash[:notice] = "The item is now in your cart."
        redirect_to :back or products_url
    end

    def remove
       @cart = get_or_create_shopping_cart
       @cart.remove(params[:line_item_id])
       flash[:notice] = "Item removed from cart."
       redirect_to :back or cart_url
    end
end
