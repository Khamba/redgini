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
end
