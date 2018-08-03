class ChangeDatatypeMatchingMessageOfMatchings < ActiveRecord::Migration[5.1]
  def change
  	change_column :matchings, :matching_message, :text
  end
end
