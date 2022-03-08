class Admin::LinksController < Admin::BaseController
	before_action :set_link, only: [:show, :edit, :update, :destroy]


  def index
    @links = Link.all
  end

  def new
   @link = Link.new
  end

  def edit
  end

  def create
    @link = Link.new(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to admin_links_path, notice: 'Poveznica uspješno dodana.' }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to admin_links_path, notice: 'Poveznica uspješno ažurirana.' }
        format.json { render :show, status: :ok, location: @link }
      else
        format.html { render :edit }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to admin_links_path, notice: 'Poveznica uspješno obrisana.' }
      format.json { head :no_content }
    end
  end

  private
    def set_link
      @link = Link.find(params[:id]) || not_found
    end

    def link_params
        params.require(:link).permit(:title, :link, :favicon)
    end
end
