class CreateNeeds < ActiveRecord::Migration[5.1]
  def change
    create_table :needs do |t|
      t.string :need_title
      t.text :need_text
      t.date :match_time
      t.string :place
      t.boolean :delete_flag
      t.integer :matching_id
      t.integer :user_id
      t.integer :status_id

      t.timestamps
    end
  end
end
