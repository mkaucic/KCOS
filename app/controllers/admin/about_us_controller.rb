class Admin::AboutUsController < Admin::BaseController
	before_action :set_text, only: [:show, :edit, :update, :destroy]
		def show
			@about_us = AboutUs.first
			@about_us_info = AboutUs.all
			@teams = Team.all
			@home_static_text = HomeStaticText.first
		end

		def new
    		@about_us = Event.new
  		end

		def edit
		end

		def update 
		    respond_to do |format|
		      if @about_us.update(about_us_params)
		        format.html { redirect_to admin_about_us_path, notice: 'O nama tekst uspješno uređen' }
		        format.json { render :show, status: :ok, location: @about_us}
		      else
		        format.html { render :edit }
		        format.json { render json: @about_us.errors, status: :unprocessable_entity }
		      end
		    end
		end

	private 

		def about_us_params
	      params.require(:about_us).permit(:title, :static_body, :image)
	    end
	    def set_text
      	  @about_us = AboutUs.first || not_found
    	end
end
