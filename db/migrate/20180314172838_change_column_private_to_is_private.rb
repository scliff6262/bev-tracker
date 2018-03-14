class ChangeColumnPrivateToIsPrivate < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :private, :is_private
  end
end
