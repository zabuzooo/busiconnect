class AddMatchingSToMatchings < ActiveRecord::Migration[5.1]
  def change
    add_column :matchings, :matching_s, :integer, default: 0
  end
end
