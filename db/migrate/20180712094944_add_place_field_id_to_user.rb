class AddPlaceFieldIdToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :place_field_id, :integer
  end
end
