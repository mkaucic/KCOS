class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.string :title
      t.string :link
      t.string :favicon

      t.timestamps
    end
  end
end
