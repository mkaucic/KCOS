class CreateActionLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :action_logs do |t|
      t.string :action
      t.integer :admin_id
      t.string :loggable_type
      t.integer :loggable_id
      t.text :params

      t.timestamps
    end
  end
end
