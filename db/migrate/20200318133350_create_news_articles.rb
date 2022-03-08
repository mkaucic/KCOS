class CreateNews < ActiveRecord::Migration[5.1]
  def change
    create_table :news_articles do |t|
      t.string :image 
      t.string :headline, null: false
      t.text :text, null: false 
      t.string :type, null: false
      t.boolean :starred, default: false 

      t.timestamps
    end
  end
end
