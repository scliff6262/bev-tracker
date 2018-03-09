class CreateBeverages < ActiveRecord::Migration[5.1]
  def change
    create_table :beverages do |t|
      t.string :name
      t.string :category
      t.integer :rating
      t.text :comments
      t.integer :user_id
    end

  end
end
