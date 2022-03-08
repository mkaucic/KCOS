class ChangeIbanAndMbToBeStringInContactInfos < ActiveRecord::Migration[5.1]
  def change
  	change_column :contact_infos, :iban, :string
  	change_column :contact_infos, :mb, :string
  end
end
