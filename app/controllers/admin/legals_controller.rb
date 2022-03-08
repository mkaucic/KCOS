class Admin::LegalsController < Admin::BaseController
	before_action :set_legal
	def edit
		@legal = Legal.first
	end

	def show
		@legal = Legal.first
	end

	def update 
		@legal = Legal.first
		respond_to do |format|
	      if @legal.update(legal_params)
	        format.html { redirect_to admin_root_path, notice: 'Legal uređen.' }
	        format.json { render :show, status: :ok, location: @legal}
	      else
	        format.html { render :edit }
	        format.json { render json: @legal.errors, status: :unprocessable_entity }
	      end
	    end
	end

	private 

	def legal_params
	    params.require(:legal).permit(:gdpr, :privacy_policy, :impresum)
	end

	def set_legal
		@legal = Legal.first
	end
end

