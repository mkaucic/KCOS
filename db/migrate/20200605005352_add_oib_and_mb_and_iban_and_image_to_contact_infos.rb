class AddOibAndMbAndIbanAndImageToContactInfos < ActiveRecord::Migration[5.1]
  def change
    add_column :contact_infos, :oib, :integer
    add_column :contact_infos, :mb, :integer
    add_column :contact_infos, :iban, :integer
    add_column :contact_infos, :image, :string
  end
end
