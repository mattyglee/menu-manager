class CreateFoodItems < ActiveRecord::Migration
  def change
    create_table :food_items do |t|
      t.integer :shopping_list_id
      t.integer :food_id
      t.string :quantity

      t.timestamps
    end
  end
end
