class AddPrivacyColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :privacy, :string
  end
end
