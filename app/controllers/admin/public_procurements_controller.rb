class Admin::PublicProcurementsController < Admin::BaseController
  before_action :set_public_procurement, only: [:show, :edit, :update, :destroy]


  def index
    @public_procurements = PublicProcurement.all
  end


  def show
    @public_procurement = PublicProcurement.find(params[:id]) || not_found
  end


  def new
   @public_procurement = PublicProcurement.new
  end

  def edit
  end

  def create
    @public_procurement = PublicProcurement.new(public_procurement_params)

    respond_to do |format|
      if @public_procurement.save
        format.html { redirect_to admin_public_procurements_path, notice: 'Dokument javne nabave uspješno dodan.' }
        format.json { render :show, status: :created, location: @public_procurement }
      else
        format.html { render :new }
        format.json { render json: @public_procurement.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      if @public_procurement.update(public_procurement_params)
        format.html { redirect_to admin_public_procurements_path, notice: 'Dokument javne nabave uspješno ažuriran.' }
        format.json { render :show, status: :ok, location: @public_procurement }
      else
        format.html { render :edit }
        format.json { render json: @public_procurement.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @public_procurement.destroy
    respond_to do |format|
      format.html { redirect_to admin_public_procurements_path, notice: 'Dokument javne nabave uspješno obrisan.' }
      format.json { head :no_content }
    end
  end

  private
    def set_public_procurement
      @public_procurement = PublicProcurement.find(params[:id]) || not_found
    end

    def public_procurement_params
        params.require(:public_procurement).permit(:title, :link, :year)
    end
end
