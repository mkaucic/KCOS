class Admin::SocialNetworksController < Admin::BaseController
	before_action :set_network, only: [:show, :edit, :update]
	def index
		@social_networks = SocialNetwork.all
	end

	def show
	end

	def new
		@social_network = SocialNetwork.new
	end

	def edit
	end

	def create
		@social_network = SocialNetwork.new(social_network_params)
		if @social_network.save
			respond_to do |format|
			  format.html { redirect_to admin_social_networks_path, notice: 'Društvena mreža dodana!' }
			end
		end
	end
	
	def update 
	    respond_to do |format|
	      if @social_network.update(social_network_params)
	        format.html { redirect_to admin_social_networks_path, notice: 'Link do društvene mreže uređen' }
	        format.json { render :show, status: :ok, location: @social_network}
	      else
	        format.html { render :edit }
	        format.json { render json: @social_network.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def destroy
		@social_network = SocialNetwork.find(params[:id])
		@social_network.destroy
		respond_to do |format|
		  format.html { redirect_to admin_social_networks_path, notice: 'Društvena mreža obrisana!' }
		end
	end


private 

	def social_network_params
      params.require(:social_network).permit(:url, :name)
    end
    def set_network
  	  @social_network = SocialNetwork.find(params[:id]) || not_found
	end
end
