class Consumption < ApplicationRecord
	belongs_to :user


	scope :current_month, -> { where('created_at > ?', Time.now.beginning_of_month )}



	def self.total_price
		Consumption.all.map {|c| c.total_price}.sum
	end

	def self.total_km 
		Consumption.all.map {|c| c.kilometers}.sum
	end
end
