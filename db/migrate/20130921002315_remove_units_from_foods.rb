class RemoveUnitsFromFoods < ActiveRecord::Migration
  def up
  	remove_column :foods, :cups
  	remove_column :foods, :tablespoons
  	remove_column :foods, :teaspoons
  end

  def down
  	add_column :foods, :cups, :precision => 5, :scale => 3
  	add_column :foods, :teaspoons, :precision => 7, :scale => 3
  	add_column :foods, :tablespoons, :precision => 7, :scale => 3
  end
end
