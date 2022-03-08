class Admin::TeamImagesController < Admin::BaseController
	before_action :find_team

	def index
		@team_image = @team.team_images.new
		@team_images = @team.team_images.all
	end

	def create
		@team_image = @team.team_images.new(image_params) 
		if @team_image.save
			render json: { message: "success", teamId: @team.id, team_imageId: @team_image.id, url: @team_image.image.url }, status: 200
		else
			render json: { error: @team_image.errors.full_messages.join(", ") }, status: 400
		end
	end

	def destroy
		@team_image = TeamImage.find(params[:id])
		if @team_image.destroy
			respond_to do |format|
				format.json {render json: { message: "file deleted from server", deleted_id: "image_#{@team_image.id}" }}
				format.js
			end
		else
			respond_to do |format|
				format.json {render json: { message: @team_image.errors.full_messages.join(", ") }}
				format.js
			end
		end
	end

	def sort
		params[:team_image].each_with_index do |id, index|
      		TeamImage.where(id: id).update_all(position: index + 1)
  		end
	end

	private

		def find_team
	   	 	@team = Team.find(params[:team_id])
	  	end

		def image_params
			params.require(:team_image).permit(:image, :position)
		end

end


