class ChangePrivateBooleans < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :is_private, 'boolean USING CAST(is_private AS boolean)'
  end
end
