class Admin::VenuesController < Admin::BaseController
	before_action :set_venue, only: [:show, :edit, :update, :destroy]

    def index
    	@venues = Venue.all
  	end

	def show
    	@venue = Venue.find(params[:id])  || not_found
	end

	def new
		@venue = Venue.new
	end

	def edit
	end
 	
 	def edit_capacities 
		@venue = Venue.find(params[:id]) || not_found
	end

	
	def create
		@venue = Venue.new(capacity_venue_params)

		respond_to do |format|
		  if @venue.save
	        format.html {redirect_to admin_venue_venue_images_path(@venue.id), notice: 'Prostor uspješno dodan.'}
		    format.json { render :show, status: :created, location: @venue }
		  else
		    format.html { render :new }
		    format.json { render json: @venue.errors, status: :unprocessable_entity }
		  end
		end
	end

	def update
		respond_to do |format|
		  if @venue.update(capacity_venue_params)
		    format.html { redirect_to admin_venues_path, notice: 'Prostor uspješno ažuriran.' }
		    format.json { render :show, status: :ok, location: @venue }
		  else
		    format.html { render :edit }
		    format.json { render json: @venue.errors, status: :unprocessable_entity }
		  end
		end
	end

	def destroy
		@venue.destroy
		respond_to do |format|
		  format.html { redirect_to admin_venues_path, notice: 'Prostor uspješno obrisan.' }
		  format.json { head :no_content }
		end
	end

	def sort
	    params[:venue].each_with_index do |id, index|
	      Venue.where(id: id).update_all(position: index + 1)
	      
	    end
  	end

  private
   
    def set_venue
      @venue = Venue.find(params[:id]) || not_found
    end

    def venue_params
      params.require(:venue).permit(:name, :description, :image, :position)
    end	

    def capacity_venue_params
    	params.require(:venue).permit(:name, :description, :image, :position, capacity_venues_attributes: [:id, :name, :capacity, :_destroy])
    end
end
