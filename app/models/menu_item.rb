class MenuItem < ActiveRecord::Base
  attr_accessible :having, :menu_id, :recipe_id
  
  belongs_to :menu
  belongs_to :recipe
end
