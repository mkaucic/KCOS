class CreateHomeStaticTexts < ActiveRecord::Migration[5.1]
  def change
    create_table :home_static_texts do |t|
      t.string :title
      t.text :static_text

      t.timestamps
    end
  end
end
