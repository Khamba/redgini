class CartController < ApplicationController
    
    def show
       @cart = get_or_create_shopping_cart
       @line_item = @cart.line_items 
    end
    
    def add
        @cart = get_or_create_shopping_cart
        @cart.add(params[:product_id], params[:quantity])
        redirect_to :back or products_url
    end
    
    def remove
       @cart = get_or_create_shopping_cart
       @cart.remove(params[:product_id])
       redirect_to :back or cart_url
    end
end
