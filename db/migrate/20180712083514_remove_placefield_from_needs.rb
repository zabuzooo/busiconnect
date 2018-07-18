class RemovePlacefieldFromNeeds < ActiveRecord::Migration[5.1]
  def change
    remove_column :needs, :Placefield, :string
  end
end
