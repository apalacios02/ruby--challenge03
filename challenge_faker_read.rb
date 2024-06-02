# Author: Allan Palacios

load 'ar.rb'

# Retrieve all categories
all_categories = Category.all

# Display category names and associated products
all_categories.each do |category|
  puts "Category: #{category.name}"

  # Fetch associated products for the category
  products = category.products

  # Display product names and prices
  products.each do |product|
    puts "  Product: #{product.name} (Price: $#{product.price})"
  end

  puts "\n" # Add a newline for better formatting
end
