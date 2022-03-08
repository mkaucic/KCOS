class ContactInfo < ApplicationRecord
	include LogActions
	mount_uploader :image, ImageUploader
	
	validates_presence_of :name, :address, :email
	validates :longitude, inclusion: -180..180, allow_nil: true
	validates :latitude, inclusion: -90..90, allow_nil: true
	validates :oib, format: { with: /\A\d+\z/, message: "Dopušten je unos samo brojeva!" }
	validates :mb, format: { with: /\A\d+\z/, message: "Dopušten je unos samo brojeva!" }
	
	

end
