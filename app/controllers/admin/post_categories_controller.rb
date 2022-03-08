class Admin::PostCategoriesController < Admin::BaseController
 before_action :set_post_category, only: [:show, :edit, :update, :destroy]


  def index
    @post_categories = PostCategory.all
  end


  def show
    @post_category = PostCategory.find(params[:id]) || not_found
  end


  def new
    @post_category = PostCategory.new
  end

  def edit
  end

  def create
    @post_category = PostCategory.new(post_category_params)

    respond_to do |format|
      if @post_category.save
        format.html { redirect_to admin_post_categories_path, notice: 'Kategorija uspješno dodana.' }
        format.json { render :show, status: :created, location: @post_category }
      else
        format.html { render :new }
        format.json { render json: @post_category.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      if @post_category.update(post_category_params)
        format.html { redirect_to admin_post_categories_path, notice: 'Kategorija uspješno ažurirana.' }
        format.json { render :show, status: :ok, location: @post_category }
      else
        format.html { render :edit }
        format.json { render json: @post_category.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @post_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_post_categories_path, notice: 'Kategorija uspješno obrisana.' }
      format.json { head :no_content }
    end
  end

  private
    def set_post_category
      @post_category = PostCategory.find(params[:id]) || not_found
    end

    def post_category_params
        params.require(:post_category).permit(:name)
    end	
end
