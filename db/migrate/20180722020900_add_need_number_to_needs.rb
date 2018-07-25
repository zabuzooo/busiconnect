class AddNeedNumberToNeeds < ActiveRecord::Migration[5.1]
  def change
    add_column :needs, :need_number, :string
  end
end
