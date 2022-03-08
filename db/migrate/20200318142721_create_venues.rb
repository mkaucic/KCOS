class CreateVenues < ActiveRecord::Migration[5.1]
  def change
    create_table :venues do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :image 
      t.integer :capacity_first, default: nil
      t.integer :capacity_second, default: nil     #nisam pametan
      t.integer :capacity_third, default: nil

      t.timestamps
    end
  end
end
