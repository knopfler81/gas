class AddCarIdToConsumption < ActiveRecord::Migration[5.2]
  def change
  	add_column :consumptions, :car_id, :integer
  end
end
