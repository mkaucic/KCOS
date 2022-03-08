class AddImageToAboutUs < ActiveRecord::Migration[5.1]
  def change
    add_column :about_us, :image, :string
  end
end
