module Tagging
	extend ActiveSupport::Concern
	included do 
		before_create :map_tags
		before_update :map_tags
	end

	def map_tags
		hashtags = self.text.scan(/#\w+/)
		self.tags.clear unless self.id_changed?
		hashtags.uniq.map do |hashtag|
			tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
			self.tags << tag
		end 	
		Tag.all.each do |tag|
			next if tag == self
			tag.destroy! if tag.news_articles.empty? && tag.events.empty?
		end
	end
end
