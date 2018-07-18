class CreatePlaceFields < ActiveRecord::Migration[5.1]
  def change
    create_table :place_fields do |t|
      t.string :place

      t.timestamps
    end
  end
end
