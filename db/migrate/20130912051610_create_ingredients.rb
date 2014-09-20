class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :unit
      t.decimal :quantity, :precision => 10, :scale => 3
      t.string :description
      t.integer :food_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end
