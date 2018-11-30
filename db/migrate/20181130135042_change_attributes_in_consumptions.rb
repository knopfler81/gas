class ChangeAttributesInConsumptions < ActiveRecord::Migration[5.2]
  def change
  	change_column :consumptions, :kilometers, :integer
  	remove_column :consumptions, :total_liters
  end
end
