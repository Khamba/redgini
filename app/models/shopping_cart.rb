# == Schema Information
#
# Table name: shopping_carts
#
#  id         :integer          not null, primary key
#  total      :integer
#  order_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShoppingCart < ActiveRecord::Base

    has_many :line_items
    belongs_to :order

    def add(product_id, quantity)
        product = Product.find(product_id)
        line_item = self.line_items.where(product: product).first
        if line_item
            line_item.update(quantity: quantity)
        else
           LineItem.create(product: product, unit_price: product.price, quantity: quantity, shopping_cart: self)
        end
        update_total
    end

    def remove(line_item_id)
       self.line_items.where(id: line_item_id).destroy_all
       update_total
    end

    def clear_cart
       self.line_items.destroy_all
    end

    def empty?
        self.line_items.empty?
    end
    private

        def update_total
            self.total = self.line_items.sum(:total)
            self.save
        end

end
