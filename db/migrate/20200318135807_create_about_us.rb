class CreateAboutUs < ActiveRecord::Migration[5.1]
  def change
    create_table :about_us do |t|
      t.string :title, null: false 
      t.text :static_body, null: false 

      t.timestamps
    end
  end
end
