class NewsArticlesController < ApplicationController
	def show
		@news_article = NewsArticle.from_param(params[:id]) || not_found 
	end

	def index
		@navigation_is_transparent = true
		@starred_count = NewsArticle.eligible_for_publishing.where(starred: true).count
		if @starred_count == 0
			@news_articles = NewsArticle.eligible_for_publishing.sort_by(&:publish_date).reverse.take(2)  
			@starred_count = 2 #Min 2 starred objave
			return
		end

		if @starred_count == 1
			@news_articles << NewsArticle.eligible_for_publishing.where(starred: true).first
			@news_articles << NewsArticle.eligible_for_publishing.where(starred: false).sort_by(&:publish_date).reverse.first
			@starred_count = 2
			return
		end

		if @starred_count > 5
			@news_articles = NewsArticle.eligible_for_publishing.where(starred: true).sort_by(&:publish_date).reverse.take(5)
			@starred_count = 5 #Max 5 starred objava
			return
		end
		@news_articles = NewsArticle.eligible_for_publishing.where(starred: true).sort_by(&:publish_date).reverse
	end

	def all
		@news = NewsArticle.eligible_for_publishing.sort_by(&:publish_date).reverse

	end
end
