class Food < ActiveRecord::Base
  attr_accessible :food_group_id, :grams, :item_description, :millilitres, :name, :preferred_unit
  
  belongs_to :food_group
  has_many :ingredients, dependent: :destroy
  
  validates :name, presence: true
  validates :name, uniqueness: true
  
  UNITS = { :ITEM => 'item',
  					:CUPS => 'cups',
  					:GRAMS => 'grams',
  					:MILLILITRES => 'millilitres',
  					:TABLESPOONS => 'tablespoons',
  					:TEASPOONS => 'teaspoons' }

  FRACTIONAL_UNITS = { :ITEM => 'item',
  					:CUPS => 'cups',
  					:TABLESPOONS => 'tablespoons',
  					:TEASPOONS => 'teaspoons' }

  PREFERRED_UNITS = { :ITEM => 'item',
					  					:GRAMS => 'grams',
					  					:MILLILITRES => 'millilitres' }

  FRACTION_UNITS = { '1/4' => 0.25,
  							'1/3' => 0.333,
  							'1/2' => 0.5,
  							'2/3' => 0.667,
  							'3/4' => 0.75,
  							'1' => 1.0,
  							'1&1/4' => 1.25,
  							'1&1/3' => 1.333,
  							'1&1/2' => 1.5,
  							'1&2/3' => 1.667,
  							'1&3/4' => 1.75,
  							'2' => 2.0,
  							'2&1/2' => 2.5,
  							'3' => 3.0,
  							'4' => 4.0 }
  
  def grams_to_item(quantity_in_grams)
  	(quantity_in_grams.to_f / self.grams.to_f).ceil
  end
  
  def cups_to_item(quantity_in_cups)
  	(quantity_in_cups * 250 / self.millilitres.to_f).ceil
  end
  
  def cups_to_grams(quantity_in_cups)
  	(quantity_in_cups * 250 * self.grams.to_f / self.millilitres.to_f).ceil
  end
  
  def cups_to_millilitres(quantity_in_cups)
  	(quantity_in_cups * 250).ceil
  end
    
  def grams_to_millilitres(quantity_in_grams)
  	(quantity_in_grams.to_f * self.millilitres.to_f / self.grams.to_f).ceil
  end
  
  def teaspoons_to_item(quantity_in_teaspoons)
  	(quantity_in_teaspoons.to_f * 5.0 / self.millilitres.to_f).ceil
  end
  
  def tablespoons_to_item(quantity_in_tablespoons)
  	(quantity_in_tablespoons.to_f * 15.0 / self.millilitres.to_f).ceil
  end
  
  def teaspoons_to_grams(quantity_in_teaspoons)
  	(quantity_in_teaspoons.to_f * 5.0 * self.grams.to_f / self.millilitres.to_f).ceil
  end
  
  def tablespoons_to_grams(quantity_in_tablespoons)
  	(quantity_in_tablespoons.to_f * 15.0 * self.grams.to_f / self.millilitres.to_f).ceil
  end
  
  def shopping_list_name(quantity = "1")
  	quantity = quantity.to_f.ceil
  	retval = ""
  	if self.preferred_unit == Food::UNITS[:ITEM]
  		if !self.item_description.nil? && self.item_description != ""
  			retval = self.item_description + " "
  		end
  	else
  		retval = self.preferred_unit + " "
  	end
  	if retval == ""
	  	retval = self.name.pluralize(quantity)
  	else
	  	retval += self.name
  	end
  	return retval
  end
  
  def recipe_name
  	if self.item_description.present?
  		return "#{self.name} #{self.item_description}"
  	else
  		return self.name
  	end
  end
end
