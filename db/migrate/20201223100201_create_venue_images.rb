class CreateVenueImages < ActiveRecord::Migration[5.1]
  def change
    create_table :venue_images do |t|
      t.string :image
      t.references :venue, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
