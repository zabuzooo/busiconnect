class AddImageIdToNeeds < ActiveRecord::Migration[5.1]
  def change
    add_column :needs, :image_id, :string
  end
end
