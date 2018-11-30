module ConsumptionsHelper

	def fill_in_count
		@consumptions.count - 1
	end

	def total_fillin_prices
		if @consumptions.count == 0
			0
		elsif @consumptions.count <= 1
			@consumptions.last.total_price
		else
			last = @consumptions.last.total_price
			res = (@consumptions.map { |c| c.total_price }.sum - last)
		end
	end

	def averrage_per_km
		@consumptions.count <= 1 ? 0 : total_fillin_prices / total_km
	end

	def averrage_for_100km
		@consumptions.count <= 1 ? 0 : averrage_per_km * 100
	end


	def difference(c, index)	 #nombre de km entre deux remplissages
		if index == 0
			0
		else
			c.kilometers - @consumptions[index - 1].kilometers
		end
	end

	def total_km
		res = []
		@consumptions.each_with_index.map do |c, index|
			unless index == 0
			 	res << c.kilometers - @consumptions[index - 1].kilometers
			end
		end
		res.sum
	end
end
