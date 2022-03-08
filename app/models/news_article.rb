class NewsArticle < ApplicationRecord
	include Tagging
	
	scope :eligible_for_publishing, -> { where("publish_date <= ?", Date.today) }

	has_and_belongs_to_many :tags
	has_many :news_article_images
	mount_uploader :image, ImageUploader
	validates :slug, uniqueness: true
	validates :slug, presence: true
	validates :headline, presence: true
#	validates :text, length: { minimum: 30 }
	validates :publish_date, presence: true

	
	def to_param
  		slug
	end
	
	def self.from_param(slug)
	  self.find_by(slug: slug.strip)
	end
end
