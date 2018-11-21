class Car < ApplicationRecord
	belongs_to :user
	has_many :consumptions, dependent: :destroy
	mount_uploader :image, ImageUploader
end
