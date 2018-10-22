class Consumption < ApplicationRecord

	def self.total
		Consumption.all.map {|c| c.total_price}.sum
	end
end
