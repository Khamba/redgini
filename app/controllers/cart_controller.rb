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
    
    private
    
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
