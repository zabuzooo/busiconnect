class AddPlaceFieldIdToNeeds < ActiveRecord::Migration[5.1]
  def change
    add_column :needs, :place_field_id, :integer
  end
end
