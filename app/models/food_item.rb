class FoodItem < ActiveRecord::Base
  attr_accessible :food_id, :quantity, :shopping_list_id
  
  belongs_to :food
  belongs_to :shopping_list
  
  def display
  	begin
	  	if self.food.preferred_unit == 'item'
	  		if self.food.item_description.empty? 
	  			return self.quantity.to_f.ceil.to_s + " " + self.food.name.pluralize(self.quantity.to_f.ceil) 
	  		 else
	  			return (self.quantity.to_f < 1.0 ? self.quantity.to_f.to_s : self.quantity.to_f.ceil.to_s) + " " + self.food.item_description.pluralize(self.quantity.to_f < 1.0 ? self.quantity.to_f : self.quantity.to_f.ceil) + " " + self.food.name
	  		 end 
	  	else 
				return self.quantity.to_f.ceil.to_s + " " + self.food.preferred_unit.pluralize(self.quantity.to_f.ceil) + " " + self.food.name 
	  	end
	  rescue
	  	return "error with food id: #{self.food_id}"
	  end
  end
end
