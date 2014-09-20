class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :food_group_id
      t.string :preferred_unit
      t.decimal :cups, :precision => 5, :scale => 3
      t.integer :millilitres
      t.integer :grams
      t.decimal :teaspoons, :precision => 7, :scale => 3
      t.decimal :tablespoons, :precision => 7, :scale => 3
      t.string :item_description

      t.timestamps
    end
  end
end
