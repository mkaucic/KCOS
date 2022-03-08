class AddVenueRefToVenueCapacity < ActiveRecord::Migration[5.1]
  def change
    add_reference :capacity_venues, :venue, foreign_key: true
  end
end
