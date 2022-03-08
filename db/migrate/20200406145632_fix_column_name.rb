class FixColumnName < ActiveRecord::Migration[5.1]
  def change
  	rename_column :teams, :picture, :image
  end
end
