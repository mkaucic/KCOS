class CreateNewsArticleImages < ActiveRecord::Migration[5.1]
  def change
    create_table :news_article_images do |t|
      t.string :image
      t.references :news_article, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
