# == Schema Information
#
# Table name: line_items
#
#  id               :integer          not null, primary key
#  product_id       :integer
#  unit_price       :integer
#  quantity         :integer
#  total            :integer
#  shopping_cart_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :shopping_cart
end
