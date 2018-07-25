class AddSettlementIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :settlement_id, :integer
  end
end
