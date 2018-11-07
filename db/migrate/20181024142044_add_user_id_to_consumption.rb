class AddUserIdToConsumption < ActiveRecord::Migration[5.2]
  def change
    add_column :consumptions, :user_id, :integer
  end
end
