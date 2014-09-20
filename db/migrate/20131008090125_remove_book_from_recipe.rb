class RemoveBookFromRecipe < ActiveRecord::Migration
  def change
  	remove_column :recipes, :book
  end
end
