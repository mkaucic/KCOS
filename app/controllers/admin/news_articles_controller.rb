class Admin::NewsArticlesController< Admin::BaseController
	 before_action :set_news_article, only: [:show, :edit, :update, :destroy]


  def index
    @news_articles = NewsArticle.all
  end


  def show
    @news_article = NewsArticle.from_param(params[:id]) || not_found
  end


  def new
    @news_article = NewsArticle.new
    @toggle_date_new = true
  end

  def edit
    @toggle_edit_button = true
    @toggle_date_edit = true

  end

  def toggle_starred
    news_article = NewsArticle.from_param(params[:id]) || not_found
    updated = news_article.update(starred: !news_article.starred)
    if updated
      redirect_to admin_news_articles_path, notice: "Novost je #{news_article.starred ? 'istaknuta' : 'uklonjena sa popisa istaknutih'}"
    else
      redirect_to admin_news_articles_path, notice: "Greška"
    end
  end

  def create
    @news_article = NewsArticle.new(news_article_params)

    respond_to do |format|
      if @news_article.save
        format.html { redirect_to admin_news_article_news_article_images_path(@news_article.slug), notice: 'Novost uspješno dodana.' }
        format.json { render :show, status: :created, location: @news_article }
      else
        format.html { render :new }
        format.json { render json: @news_article.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      if @news_article.update(news_article_params)
        format.html { redirect_to admin_news_articles_path, notice: 'Novost uspješno ažurirana.' }
        format.json { render :show, status: :ok, location: @news_article }
      else
        format.html { render :edit }
        format.json { render json: @news_article.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @news_article.destroy
    respond_to do |format|
      format.html { redirect_to admin_news_articles_path, notice: 'Novost uspješno obrisana.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news_article
      @news_article = NewsArticle.from_param(params[:id]) || not_found
    end

    # Only allow a list of trusted parameters through.
    def news_article_params
        params.require(:news_article).permit(:image, :headline, :news_type, :text, :starred, :slug, :brief, :publish_date)
    end
end

