class Admin::EventImagesController < Admin::BaseController
	before_action :find_event

	def index
		@event_image = @event.event_images.new
		@event_images = @event.event_images.all
	end

	def create
		@event_image = @event.event_images.new(image_params) 
		if @event_image.save
			render json: { message: "success", eventId: @event.slug, event_imageId: @event_image.id, url: @event_image.image.url }, status: 200
		else
			render json: { error: @event_image.errors.full_messages.join(", ") }, status: 400
		end
	end

	def destroy
		@event_image = EventImage.find(params[:id])
		if @event_image.destroy
			respond_to do |format|
				format.json {render json: { message: "file deleted from server", deleted_id: "image_#{@event_image.id}" }}
				format.js
			end
		else
			respond_to do |format|
				format.json {render json: { message: @event_image.errors.full_messages.join(", ") }}
				format.js
			end
		end
	end

	def sort
		params[:event_image].each_with_index do |id, index|
      		EventImage.where(id: id).update_all(position: index + 1)
  		end
	end

	private

		def find_event
	   	 	@event = Event.from_param(params[:event_id])
	  	end

		def image_params
			params.require(:event_image).permit(:image, :position)
		end

end
