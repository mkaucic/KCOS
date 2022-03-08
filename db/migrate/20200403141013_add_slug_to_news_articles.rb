class AddSlugToNewsArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :news_articles, :slug, :string
  end
end
