class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :image
      t.string :headline, null: false
      t.date :start_date
      t.date :end_date, default: nil
      t.time :starting_at
      t.string :type, null: false
      t.string :text
      t.boolean :starred, default: false

      t.timestamps
    end
  end
end
