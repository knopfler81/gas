class User < ApplicationRecord
	has_many :consumptions, through: :cars
	has_many :cars, dependent: :destroy
	
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end