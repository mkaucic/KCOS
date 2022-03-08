class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      t.string :title
      t.string :link
      t.integer :year

      t.timestamps
    end
  end
end
