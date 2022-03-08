class AddPublishDateToNewsArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :news_articles, :publish_date, :date
  end
end
