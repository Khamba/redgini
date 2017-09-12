# == Schema Information
#
# Table name: orders
#
#  id            :integer          not null, primary key
#  delivery_date :date
#  delivery_type :string
#  delivery_time :string
#  status        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#

class Order < ActiveRecord::Base
    has_one :shopping_cart
    belongs_to :user
    has_one :address, through: :user
    
    after_create :send_emails_and_texts
    
    private
    
        def send_emails_and_sms
           send_email_to_customer
           send_email_to_admin
           send_text_to_customer
           send_text_to_admin
        end
        
        def send_email_to_customer
           #TODO 
        end
        
        def send_email_to_admin
            #TODO
        end
        
        def send_text_to_admin
            #TODO
        end
        
        def send_text_to_customer
            #TODO
        end
    
end
