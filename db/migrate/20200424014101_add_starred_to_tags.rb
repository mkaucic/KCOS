class AddStarredToTags < ActiveRecord::Migration[5.1]
  def change
    add_column :tags, :starred, :boolean
  end
end
