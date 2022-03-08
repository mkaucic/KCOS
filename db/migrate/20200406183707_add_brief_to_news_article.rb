class AddBriefToNewsArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :news_articles, :brief, :string
  end
end
