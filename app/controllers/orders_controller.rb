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
            send_emails_and_texts
            redirect_to thank_you_url
        else
            render :new
        end
    end
    
    def show
        
    end
    
    private
    
        def order_params
            # TODO
            params.require(:order).permit() 
        end
end
