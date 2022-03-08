class Team < ApplicationRecord
	mount_uploader :image, ImageUploader
	has_many :team_images, dependent: :destroy
end
