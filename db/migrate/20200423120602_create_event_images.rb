class CreateEventImages < ActiveRecord::Migration[5.1]
  def change
    create_table :event_images do |t|
      t.string :image
      t.references :event, index: true, foreign_key: true

      t.timestamps
    end
  end
end
