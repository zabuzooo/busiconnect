class AddPlaceMToPlaceFields < ActiveRecord::Migration[5.1]
  def change
    add_column :place_fields, :place_m, :string
  end
end
