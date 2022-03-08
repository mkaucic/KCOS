class CreateSocialNetworks < ActiveRecord::Migration[5.1]
  def change
    create_table :social_networks do |t|
      t.string :name 
      t.string :favicon, null: false
      t.string :url, null: false

      t.timestamps
    end
  end
end
