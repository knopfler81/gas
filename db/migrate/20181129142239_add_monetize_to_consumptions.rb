class AddMonetizeToConsumptions < ActiveRecord::Migration[5.2]
 def change
    change_table :consumptions do |t|
      t.monetize :liter_price 
      t.monetize :total_price
    end
  end
end
