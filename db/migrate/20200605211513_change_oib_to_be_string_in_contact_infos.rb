class ChangeOibToBeStringInContactInfos < ActiveRecord::Migration[5.1]
  def change
  	change_column :contact_infos, :oib, :string
  end
end
