class Recipe < ActiveRecord::Base
  attr_accessible :book, :method, :name, :page, :preparation_time, :total_time, :book_id
  attr_accessible :ingredients_attributes
  
  validates :name, presence: true
  
  belongs_to :book
  has_many :ingredients, dependent: :destroy
  has_many :menu_items, dependent: :destroy
  accepts_nested_attributes_for :ingredients,
  			:allow_destroy => true,
  			:reject_if     => proc { |attributes| attributes['food_id'].blank? && attributes['food_input'].blank? }
end
