class Event < ApplicationRecord
  belongs_to :user
	has_many :event_tags, dependent: :destroy
	has_many :tags, through: :event_tags

	mount_uploader :image, ImageUploader

	def self.matching_title_or_content search
		where("publish=true AND title ILIKE ? OR summary ILIKE ? OR content ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%").order(start: :asc)
	end

	def self.xmatching_title_or_content search
		where("publish=true AND title ILIKE ? OR summary ILIKE ? OR content ILIKE ? AND location= #{:location}", "%#{search}%", "%#{search}%", "%#{search}%")
	end	

	def self.filter_by_tags param_tag
		includes(:tags).where(publish: true, tags: {name: param_tag}).order(id: :asc)
	end
	
end



