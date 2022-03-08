class Admin::TagsController < Admin::BaseController
	def index
		@tags = Tag.all
	end

	def show
		@posts_events = Tag.find(params[:id]).events
		@posts_news = Tag.find(params[:id]).news_articles
		@tag = Tag.find(params[:id]).name
	end

	def toggle_starred
		Tag.all.each do |tag|
			if (tag.id == Tag.find(params[:id]).id) && Tag.find(params[:id]).starred
  				tag.update(starred: false)
  				redirect_to admin_tags_path, notice: "Tag je uklonjen sa popisa istaknutih"
  				return
  			end
  			if tag.starred = true 
  				tag.starred = false
  				tag.save!
  			end
  		end
	    tag = Tag.find(params[:id]) || not_found
	    updated = tag.update(starred: true)
	    if updated
	    	redirect_to admin_tags_path, notice: "Tag je istaknut"
	    else
	      redirect_to admin_tags_path, notice: "Greška"
	    end
  	end

  	private

end
