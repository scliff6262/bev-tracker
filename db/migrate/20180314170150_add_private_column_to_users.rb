class AddPrivateColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :private, :string
  end
end
