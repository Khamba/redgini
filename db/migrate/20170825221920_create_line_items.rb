class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :product, index: true, foreign_key: true
      t.integer :unit_price
      t.integer :quantity
      t.integer :total
      t.references :shopping_cart, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
