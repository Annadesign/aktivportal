class Image < ApplicationRecord
	belongs_to :event
	validates :image, presence: true
 	
 	mount_uploader :image, ImageUploader
end
