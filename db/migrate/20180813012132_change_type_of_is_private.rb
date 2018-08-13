class ChangeTypeOfIsPrivate < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :is_private, :string
  end
end
