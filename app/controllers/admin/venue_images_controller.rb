class Admin::VenueImagesController < Admin::BaseController
	before_action :find_venue

	def index
		@venue_image = @venue.venue_images.new
		@venue_images = @venue.venue_images.all
	end

	def create
		@venue_image = @venue.venue_images.new(image_params) 
		if @venue_image.save
			render json: { message: "success", venueId: @venue.id, venue_imageId: @venue_image.id, url: @venue_image.image.url }, status: 200
		else
			render json: { error: @venue_image.errors.full_messages.join(", ") }, status: 400
		end
	end

	def destroy
		@venue_image = VenueImage.find(params[:id])
		if @venue_image.destroy
			respond_to do |format|
				format.json {render json: { message: "file deleted from server", deleted_id: "image_#{@venue_image.id}" }}
				format.js
			end
		else
			respond_to do |format|
				format.json {render json: { message: @venue_image.errors.full_messages.join(", ") }}
				format.js
			end
		end
	end

	def sort
		params[:venue_image].each_with_index do |id, index|
      		VenueImage.where(id: id).update_all(position: index + 1)
  		end
	end

	private

		def find_venue
	   	 	@venue = Venue.find(params[:venue_id])
	  	end

		def image_params
			params.require(:venue_image).permit(:image, :position)
		end

end


