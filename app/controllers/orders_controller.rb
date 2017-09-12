class OrdersController < ApplicationController
    def new
        if current_user
            @order = Order.new(user: current_user)
        else
            redirect_to login_path
        end
    end
    
    def create
        @order = Order.new(params[:order])
        if @order.save
            redirect_to thank_you_url
        else
            render :new
        end
    end
    
    def show
        
    end
end
