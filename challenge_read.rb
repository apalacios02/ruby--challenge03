require_relative 'ar.rb'

number_of_products = Product.count

puts "There are #{number_of_products} in the products table."

# Use the Product class to find any product from the database
product = Product.first

# Inspect the Product object you have retrieved
puts product.inspect

# products table columns:
# id, name, price, stock_quantity, created_at, updated_at

# Question: Based on the columns you find, can you determine if the products table has an association with any other tables? If so, what table?
# Answer: No, there isn't an obvious association with another table.

# Total number of products
total_products = Product.count
puts "Total number of products: #{total_products}"

# Names of all products above $10 starting with the letter C
products_above_10_c = Product.where("price > ? AND name LIKE ?", 10, "C%").pluck(:name)
puts "Products above $10 starting with C: #{products_above_10_c}"

# Total number of products with low stock quantity
low_stock_products = Product.where("stock_quantity < ?", 5).count
puts "Total number of products with low stock quantity: #{low_stock_products}"

class Product < ApplicationRecord
    # Validation to ensure all non-foreign key columns are filled out
    validates_presence_of :name, :price, :stock_quantity
  
    # Validation to ensure all product names are unique and longer than 3 characters
    validates :name, presence: true, uniqueness: true, length: { minimum: 4 }
  end