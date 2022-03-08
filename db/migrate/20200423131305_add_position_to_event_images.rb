class AddPositionToEventImages < ActiveRecord::Migration[5.1]
  def change
    add_column :event_images, :position, :integer
  end
end
