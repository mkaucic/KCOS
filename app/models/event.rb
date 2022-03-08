class Event < ApplicationRecord
	include Tagging
	
	has_many :event_images
	has_and_belongs_to_many :tags
	mount_uploader :image, ImageUploader
	validates :headline, presence: true
	validates :headline, length: { minimum: 2 }
	validates :start_date, presence: true
#	validates :text, length: { minimum: 30 }
	validate  :valid_date_range_required
	validates :slug, uniqueness: true
	validates :slug, presence: true
	validates :brief, length: { maximum: 300 }

	

	def valid_date_range_required
	  if (start_date && end_date) && (end_date < start_date)
	    errors.add(:end_date, "Mora biti poslije početnog datuma")
	  end
	end

	def to_param
  		slug
	end
	
	def self.from_param(slug)
	  self.find_by(slug: slug.strip)
	end
end
