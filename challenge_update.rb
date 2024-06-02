# Author: Allan Palacios

load 'ar.rb'

# Find all products with a stock quantity greater than 40
products_to_update = Product.where("stock_quantity > 40")

# Add one to the stock quantity of each of these products
products_to_update.each do |product|
  product.stock_quantity += 1
end

# Save these changes to the database
products_to_update.each(&:save)