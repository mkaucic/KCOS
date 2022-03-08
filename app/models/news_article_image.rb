class NewsArticleImage < ApplicationRecord
  belongs_to :news_article

	mount_uploader :image, ImageUploader
	validates_presence_of :image

	default_scope { order(:position) }
end
