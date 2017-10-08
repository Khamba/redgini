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

  validates :product, presence: true
  validates :unit_price, numericality: { greater_than: 0 }
  validates :quantity, numericality: { greater_than: 0 }

  belongs_to :product
  belongs_to :shopping_cart

  before_save :set_total

  def set_total
    self.total = unit_price * quantity
  end

end
