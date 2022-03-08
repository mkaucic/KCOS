class AddPositionToVenues < ActiveRecord::Migration[5.1]
  def change
    add_column :venues, :position, :integer
  end
end
