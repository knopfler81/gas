class Consumption < ApplicationRecord
	belongs_to :user
	belongs_to :car

	validates :total_price, presence: true
	validates :kilometers, presence: true
	validates :shop, presence: true
	validates :liter_price, presence: true

 	monetize :total_price_cents
 	monetize :liter_price_cents

 	# before_save :format_total_price!
 	# before_save :format_liter_price!

 	# private
	 # 	def format_total_price!
	 # 		self.total_price = self.total_price.sub(",",".")
	 # 	end

	 # 	def format_liter_price!
	 # 		self.liter_price = self.liter_price.sub(",",".")
	 # 	end
end