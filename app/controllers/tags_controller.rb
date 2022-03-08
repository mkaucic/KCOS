class TagsController < ApplicationController
	def hashtags
			@tag = Tag.find_by(name: params[:name].downcase)
			unless @tag.nil?
				if @tag.respond_to?(:news_articles)
					@posts_news = @tag.news_articles
				end
				if @tag.respond_to?(:events)
					@posts_events = @tag.events		
				end
			end
	end
end
