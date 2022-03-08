class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :role
      t.string :name,  null: false 
      t.text :bio,  null: false 
      t.string :picture,  null: false 

      t.timestamps
    end
  end
end
