class Admin::TeamsController < Admin::BaseController
	 before_action :set_team, only: [:show, :edit, :update, :destroy]

  def show
    @team =  Team.find(params[:id]) || not_found
  end


  def new
    @team = Team.new
  end

  def edit
  end


  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html {redirect_to admin_team_team_images_path(@team.id), notice: 'Član tima dodan'}
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to admin_about_us_path, notice: 'Član tima ažuriran' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to admin_about_us_path, notice: 'Član tima obrisan' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id]) || not_found
    end

    # Only allow a list of trusted parameters through.
    def team_params
        params.require(:team).permit(:role, :name, :bio, :image)
    end
end
