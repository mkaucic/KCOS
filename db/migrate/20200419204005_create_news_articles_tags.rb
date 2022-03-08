class CreateNewsArticlesTags < ActiveRecord::Migration[5.1]
  def change
    create_table :news_articles_tags do |t|
      t.references :news_article, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true
    end
  end
end
