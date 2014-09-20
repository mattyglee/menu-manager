class AddQuantityDescriptionToIngredients < ActiveRecord::Migration
  def up
  	add_column :ingredients, :quantity_description, :string
  	
  	Ingredient.update_all "quantity_description=quantity"
  end

  def down
  	remove_column :ingredients, :quantity_description
  end
end
