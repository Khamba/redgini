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
    validates :delivery_date, presence: true
    validates :delivery_time, presence: true
    validates :user, presence: true

    has_one :shopping_cart
    belongs_to :user
    has_one :address, through: :user
    accepts_nested_attributes_for :address

    def send_emails_and_texts
        OrderMailer.send_email_to_customer(self).deliver
        OrderMailer.send_email_to_admin(self).deliver
       send_text_to_customer
       send_text_to_admin
    end

    private

        def send_text_to_admin
            #TODO
        end

        def send_text_to_customer
            #TODO
        end

end
