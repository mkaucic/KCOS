class EventImage < ApplicationRecord
  belongs_to :event

	mount_uploader :image, ImageUploader
	validates_presence_of :image

	default_scope { order(:position) }
end
