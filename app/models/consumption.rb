class Consumption < ApplicationRecord
	belongs_to :user
	belongs_to :car

	validates :total_price, presence: true
	validates :kilometers, presence: true
	validates :shop, presence: true
	validates :liter_price, presence: true
end