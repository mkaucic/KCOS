class RemoveCapacityFirstFromVenue < ActiveRecord::Migration[5.1]
  def change
    remove_column :venues, :capacity_first, :integer
    remove_column :venues, :capacity_second, :integer
    remove_column :venues, :capacity_third, :integer


  end
end
