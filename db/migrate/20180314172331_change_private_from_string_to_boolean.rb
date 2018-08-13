class ChangePrivateFromStringToBoolean < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :is_private, 'boolean USING CAST(is_private AS boolean)'
  end
end
