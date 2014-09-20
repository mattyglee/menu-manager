class ShoppingList < ActiveRecord::Base
  attr_accessible :menu_id
  attr_accessible :food_items_attributes, :other_items_attributes
  
  belongs_to :menu
  has_many :food_items
  has_many :other_items
  accepts_nested_attributes_for :food_items,
			:allow_destroy => true,
			:reject_if     => proc { |attributes| attributes['food_id'].blank? }
  accepts_nested_attributes_for :other_items,
			:allow_destroy => true,
			:reject_if     => proc { |attributes| attributes['shopping_item_id'].blank? }
  
  def self.populate_list(menu)
  	shopping_list = self.new
  	menu.menu_items.each do |mi|
  		mi.recipe.ingredients.each do |i|
  			food_item = FoodItem.create(:food_id => i.food_id, :quantity => i.preferred_quantity)
  			shopping_list.food_items << food_item
  		end
  	end
  	
  	shopping_list.consolidate_food_item_list!
  	return shopping_list
  end
  
  def consolidate_food_item_list!
  	consolidated_items = []
  	
  	
  	self.food_items.sort_by{|fi| fi.food.food_group_id.to_s + " " + fi.food_id.to_s}.each do |fi|
  		if consolidated_items.last.nil? || consolidated_items.last.food_id != fi.food_id
  			consolidated_items << fi
  		else
  			consolidated_items.last.quantity = (consolidated_items.last.quantity || 1) + (fi.quantity || 1)
  		end
  	end
  	
  	self.food_items = consolidated_items
  end
  
end
