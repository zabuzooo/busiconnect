class RemovePlaceFromPlaceFields < ActiveRecord::Migration[5.1]
  def change
    remove_column :place_fields, :place, :string
  end
end
