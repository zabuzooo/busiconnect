class CreateMatchings < ActiveRecord::Migration[5.1]
  def change
    create_table :matchings do |t|
      t.string :matching_message
      t.boolean :matching_flag
      t.integer :user_id
      t.integer :need_id
      t.integer :status_id

      t.timestamps
    end
  end
end
