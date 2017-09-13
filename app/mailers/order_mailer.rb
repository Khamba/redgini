class OrderMailer < ApplicationMailer
    default from: 'admin@redgini.com'
    
    def send_email_to_customer(order)
        @order = order
        @user = @order.user
        mail to: @user.email, subject: "Order Placed"
    end
    
    def send_email_to_admin(order)
        @order = order
        @user = @order.user
        mail to: 'admin@redgini.com', subject: "Order Placed"
    end
end
