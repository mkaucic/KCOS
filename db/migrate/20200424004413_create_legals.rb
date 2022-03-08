class CreateLegals < ActiveRecord::Migration[5.1]
  def change
    create_table :legals do |t|
      t.text :gdpr
      t.text :impresum
      t.text :privacy_policy

      t.timestamps
    end
  end
end
