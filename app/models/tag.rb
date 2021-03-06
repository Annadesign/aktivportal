class Tag < ApplicationRecord
	has_many :events, through: :event_tags
	
	validates :name, presence: true

	scope :promote, -> { where(promote: true).order(sortorder: :asc) }

	def in_use?
		EventTag.exists?(tag_id: self.id)
	end	

	mount_uploader :image, ImageUploader
	
end
