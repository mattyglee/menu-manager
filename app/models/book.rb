class Book < ActiveRecord::Base
  attr_accessible :short_name, :title
  
  has_many :recipes
end
