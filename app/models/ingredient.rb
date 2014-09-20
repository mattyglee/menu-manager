class Ingredient < ActiveRecord::Base
  attr_accessible :recipe_id, :food_id, :quantity, :unit, :description, :quantity_description, :food_input
  attr_accessor :food_input
  
  belongs_to :food
  belongs_to :recipe
  
  before_validation :normalize_quantity
  before_validation :check_or_create_food
  
  validates :food_id, presence: true
  validates :quantity_description, inclusion: { in: Food::FRACTION_UNITS.keys,
			message: 'must be a number or fraction for cups or items (eg. 1/2, 2/3, 1&1/4).'
	}, if: :fractional_unit?, unless: "quantity_description.match(/\d*/)"
  validates :quantity_description, allow_blank: true, numericality: true, unless: :fractional_unit?
  
  after_validation :set_quantity
  
  def normalize_quantity
  	self.quantity_description.gsub!(/[\s]/, '')
 	end
 	
 	def fractional_unit?
 		Food::FRACTIONAL_UNITS.values.include?(self.unit) 
 	end
 	
 	def check_or_create_food
 		if self.food_id.blank? and !self.food_input.blank?
 			food_group = FoodGroup.find_by_name("Misc")
 			food = Food.create!(name: self.food_input, preferred_unit: self.unit, food_group_id: food_group.id )
 			self.food = food
 		end
 	end
 	
 	def set_quantity
 		if Food::FRACTION_UNITS[self.quantity_description]
 			self.quantity = Food::FRACTION_UNITS[self.quantity_description]
 		else
 			self.quantity = self.quantity_description
 		end
 	end
  
  def preferred_quantity
  	if self.unit == self.food.preferred_unit
  		ret = self.quantity
  	else
	  	method_name = "#{self.unit}_to_#{self.food.preferred_unit}"
			if self.food.respond_to? method_name
				ret = self.food.send(method_name, self.quantity)
			else
				ret = 1
			end
		end
		return ret
  end
  
  def display
  	begin
	  	if self.unit == 'item'
	  		if self.food.item_description.empty? 
	  			return self.quantity_description + " " + self.food.name.pluralize(self.quantity.to_f.ceil) 
	  		 else
	  			return self.quantity_description + " " + self.food.item_description.pluralize(self.quantity.to_f < 1.0 ? 1 : self.quantity.to_f.ceil) + " " + self.food.name
	  		 end 
	  	else 
				return self.quantity_description + " " + self.unit.pluralize(self.quantity.to_f.ceil) + " " + self.food.name 
	  	end
	  rescue
	  	return "click here to fix new food item"
	  end
  end

end
