class VenueImage < ApplicationRecord
	belongs_to :venue
	mount_uploader :image, ImageUploader
	default_scope { order(position: :asc ) }
	
end
