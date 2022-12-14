class Admin::DocumentsController < Admin::BaseController
	 before_action :set_document, only: [:show, :edit, :update, :destroy]


  def index
    @documents = Document.all
  end


  def show
    @document = Document.find(params[:id]) || not_found
  end


  def new
   @document = Document.new
  end

  def edit
  end

  def create
    @document = Document.new(document_params)

    respond_to do |format|
      if @document.save
        format.html { redirect_to admin_documents_path, notice: 'Dokument uspješno dodan.' }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to admin_documents_path, notice: 'Dokument uspješno ažuriran.' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to admin_documents_path, notice: 'Dokument uspješno obrisan.' }
      format.json { head :no_content }
    end
  end

  private
    def set_document
      @document = Document.find(params[:id]) || not_found
    end

    def document_params
        params.require(:document).permit(:title, :link, :year)
    end
end
