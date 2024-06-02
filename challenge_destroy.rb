# Author: Allan Palacios

load 'ar.rb'

# Find the product you want to delete by its attributes (for example, by name)
product_to_delete = Product.find_by(name: "Invalid Product")

# Check if the product exists before attempting to delete it
if product_to_delete
  # Delete the product from the database
  product_to_delete.destroy
  puts "Product '#{product_to_delete.name}' has been deleted from the database."
else
  puts "Product not found."
end