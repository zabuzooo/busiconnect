class ChangeDatatypePrOfUsers < ActiveRecord::Migration[5.1]
  def change
  	change_column :users, :pr, :text
  end
end
