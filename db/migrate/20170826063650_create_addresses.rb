class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :line_1
      t.string :line_2
      t.string :area
      t.string :city
      t.string :state

      t.timestamps null: false
    end
  end
end
