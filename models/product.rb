class Product < ActiveRecord::Base
  # This AR object is linked with the products table.
  
  # A product has a many to one relationship with a category.
  # The products table has a category_id foreign key.
  # In other words, a product belongs to a category.

  validates_presence_of :name, :price, :stock_quantity
  validates_uniqueness_of :name
  validates_length_of :name, minimum: 4
  
  belongs_to :category
end