class AddEmploymentToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :employment, :string
  end
end
