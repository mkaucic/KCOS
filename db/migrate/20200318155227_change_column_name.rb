class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
  	rename_column :events, :type, :event_type
  	rename_column :news_articles, :type, :news_type
  end
end
