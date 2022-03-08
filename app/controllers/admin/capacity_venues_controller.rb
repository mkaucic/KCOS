class Admin::CapacityVenuesController < Admin::BaseController
	before_action :find_venue


	def index
		@capacities = @venue.capacity_venues.all
	end

	def show
	end 

	def new
		@capacity_venue = @venue.capacity_venues.new
	end

	def edit
		@capacity_venue = CapacityVenue.find(params[:id])
	end

	def create

		@capacity_venue = @venue.capacity_venues.new(capacity_venue_params)

		respond_to do |format|
		  if @capacity_venue.save
		    format.html { redirect_to admin_venue_capacity_venues_path(@venue.id), notice: 'Kapacitet uspješno dodan.' }
		    format.json { render :show, status: :created, location: @venue }
		  else
		    format.html { render :new }
		    format.json { render json: @venue.errors, status: :unprocessable_entity }
		  end
		end
	end

	def destroy
		@capacity_venue = CapacityVenue.find(params[:id])
		@capacity_venue.destroy
		respond_to do |format|
		  format.html { redirect_to admin_venue_capacity_venues_path(@venue.id), notice: 'Kapacitet uspješno obrisan.' }
		end
	end

	private 

	def find_venue
   	  @venue = Venue.find(params[:venue_id])
  	end

  	def capacity_venue_params
      params.require(:capacity_venue).permit(:name, :capacity)
    end	
end


