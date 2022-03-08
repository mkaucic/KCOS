class CreateTeamImages < ActiveRecord::Migration[5.1]
  def change
    create_table :team_images do |t|
      t.string :image
      t.references :team, foreign_key: true
      t.integer :position
      t.timestamps
    end
  end
end
