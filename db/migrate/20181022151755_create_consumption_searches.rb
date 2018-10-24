class CreateConsumptionSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :consumption_searches do |t|

      t.timestamps
    end
  end
end
