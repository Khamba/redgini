class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :delivery_date
      t.string :delivery_type
      t.string :delivery_time
      t.string :status

      t.timestamps null: false
    end
  end
end
