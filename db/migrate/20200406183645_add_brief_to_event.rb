class AddBriefToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :brief, :string
  end
end
