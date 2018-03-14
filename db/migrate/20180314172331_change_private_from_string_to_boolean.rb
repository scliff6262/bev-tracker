class ChangePrivateFromStringToBoolean < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :private, :boolean 
  end
end
