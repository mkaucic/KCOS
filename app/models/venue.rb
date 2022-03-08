class Venue < ApplicationRecord
	mount_uploader :image, ImageUploader
	default_scope { order(position: :asc ) }
	
	has_many :capacity_venues, dependent: :destroy
	has_many :venue_images, dependent: :destroy
	accepts_nested_attributes_for :capacity_venues, allow_destroy: true
end
