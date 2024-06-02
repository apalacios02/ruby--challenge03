# Author: Allan Palacios

load 'ar.rb'

number_of_products = Product.count

puts "There are #{number_of_products} in the products table."

# Use the Product class to find any product from the database
product = Product.first

# Inspect the Product object you have retrieved
puts product.inspect

# Columns in the products table:
# - id (Primary key)
# - name
# - price
# - stock_quantity
# - created_at
# - updated_at

# Question: Based on the columns you find, can you determine if the products table has an association with any other tables? If so, what table?
# Answer: No, there isn't an obvious association with another table.

# Total number of products
total_products = Product.count
puts "Total number of products: #{total_products}"

# Names of all products above $10 starting with the letter C
products_above_10 = Product.where("price > 10 AND name LIKE 'C%'").pluck(:name)
puts "Products above $10 with names starting with 'C': #{products_above_10}"

# Total number of products with low stock quantity
low_stock_products = Product.where("stock_quantity < 5").count
puts "Total number of products with low stock quantity: #{low_stock_products}"

# Find the name of the category associated with one of the products you have found
product = Product.first
category_name = product.category.name
puts "Category associated with the product: #{category_name}"

# Find a specific category and use it to build and persist a new product associated with this category
category = Category.find_by(name: "Beverages")
new_product = category.products.build(name: "Chianty", price: 25, stock_quantity: 50)
new_product.save

# Find a specific category and then use it to locate all the associated products over a certain price
category = Category.find_by(name: "Beverages")
products_above_price = category.products.where("price > ?", 20)
puts "Products associated with the category '#{category.name}' above $20:"
products_above_price.each do |product|
  puts product.name
end