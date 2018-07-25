class AddPurposeIdToNeeds < ActiveRecord::Migration[5.1]
  def change
    add_column :needs, :purpose_id, :integer
  end
end
