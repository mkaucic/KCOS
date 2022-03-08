class TeamImage < ApplicationRecord
	belongs_to :team
	mount_uploader :image, ImageUploader
	default_scope { order(position: :asc ) }
end
