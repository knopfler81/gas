class User < ApplicationRecord
	has_many :consumptions
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
