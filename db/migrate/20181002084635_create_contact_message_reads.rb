class CreateContactMessageReads < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_message_reads do |t|
      t.integer :admin_id
      t.integer :contact_message_id

      t.timestamps
    end
  end
end
