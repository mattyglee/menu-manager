class OtherItem < ActiveRecord::Base
  attr_accessible :shopping_item_id, :quantity, :shopping_list_id
  
  belongs_to :shopping_item
  belongs_to :shopping_list
end
