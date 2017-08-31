class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.decimal :weight, precision: 10, scale: 2
      t.string :earliest_delivery

      t.timestamps null: false
    end
  end
end
