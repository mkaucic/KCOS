class Admin::NewsArticleImagesController < Admin::BaseController
	before_action :find_news_article

	def index
		@news_article_image = @news_article.news_article_images.new
		@news_article_images = @news_article.news_article_images.all
	end

	def create
		@news_article_image = @news_article.news_article_images.new(image_params) 
		if @news_article_image.save
			render json: { message: "success", news_articleId: @news_article.slug, news_article_imageId: @news_article_image.id, url: @news_article_image.image.url }, status: 200
		else
			render json: { error: @news_article_image.errors.full_messages.join(", ") }, status: 400
		end
	end

	def destroy
		@news_article_image = NewsArticleImage.find(params[:id])
		if @news_article_image.destroy
			respond_to do |format|
				format.json {render json: { message: "file deleted from server", deleted_id: "image_#{@news_article_image.id}" }}
				format.js
			end
		else
			respond_to do |format|
				format.json {render json: { message: @news_article_image.errors.full_messages.join(", ") }}
				format.js
			end
		end
	end

	def sort
		params[:news_article_image].each_with_index do |id, index|
      		NewsArticleImage.where(id: id).update_all(position: index + 1)
  		end
	end

	private

		def find_news_article
	   	 	@news_article = NewsArticle.from_param(params[:news_article_id])
	  	end

		def image_params
			params.require(:news_article_image).permit(:image, :position)
		end

end
