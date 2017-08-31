class CreateShoppingCarts < ActiveRecord::Migration
  def change
    create_table :shopping_carts do |t|
      t.integer :total
      t.integer :order_id

      t.timestamps null: false
    end
  end
end
