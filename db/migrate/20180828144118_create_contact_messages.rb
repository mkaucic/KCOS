class CreateContactMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_messages do |t|
      t.string :email
      t.string :full_name
      t.string :message

      t.timestamps
    end
  end
end
