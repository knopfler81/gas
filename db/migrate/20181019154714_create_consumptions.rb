class CreateConsumptions < ActiveRecord::Migration[5.2]
  def change
    create_table :consumptions do |t|
      t.float :total_price
      t.float :kilometers
      t.string :shop
      t.float :liter_price
      t.float :total_liters

      t.timestamps
    end
  end
end
