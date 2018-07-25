class CreatePurposes < ActiveRecord::Migration[5.1]
  def change
    create_table :purposes do |t|
      t.string :purpose_date

      t.timestamps
    end
  end
end
