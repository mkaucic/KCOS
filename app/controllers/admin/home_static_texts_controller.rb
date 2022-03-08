class Admin::HomeStaticTextsController < Admin::BaseController
	before_action :set_home_static_text, only: [:show, :edit, :update, :destroy]

  def edit
  end

  def update
    respond_to do |format|
      if @home_static_text.update(home_static_text_params)
        format.html { redirect_to admin_about_us_path, notice: 'Tekst početne stranice ažuriran' }
        format.json { render :show, status: :ok, location: @home_static_text }
      else
        format.html { render :edit }
        format.json { render json: @home_static_text.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_home_static_text
      @home_static_text = HomeStaticText.first || not_found
    end

    def home_static_text_params
        params.require(:home_static_text).permit(:static_text, :title, :image)
    end
end
