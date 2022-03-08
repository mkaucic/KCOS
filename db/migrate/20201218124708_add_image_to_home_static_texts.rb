class AddImageToHomeStaticTexts < ActiveRecord::Migration[5.1]
  def change
    add_column :home_static_texts, :image, :string
  end
end
