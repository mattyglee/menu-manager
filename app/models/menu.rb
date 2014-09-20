class Menu < ActiveRecord::Base
  attr_accessible :start_date, :menu_items_attributes
  
  has_one :shopping_list
  has_many :menu_items, dependent: :destroy
  accepts_nested_attributes_for :menu_items,
  			:allow_destroy => true,
  			:reject_if     => :all_blank
end
