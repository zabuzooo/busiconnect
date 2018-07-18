class AddPlacefieldToNeeds < ActiveRecord::Migration[5.1]
  def change
    add_column :needs, :Placefield, :string
  end
end
