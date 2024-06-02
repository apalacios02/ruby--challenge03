# Author: Allan Palacios

load 'ar.rb'

# Configure your database connection
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: '/workspaces/challenge03/db/development.sqlite3' # Adjust the database path
)

# Create three new products using different ways to create AR objects
# 1. Using new + save
product1 = Product.new(name: "Product 1", price: 10, stock_quantity: 20)
product1.save

# 2. Using create
product2 = Product.create(name: "Product 2", price: 15, stock_quantity: 30)

# 3. Using create with a block
product3 = Product.create do |p|
  p.name = "Product 3"
  p.price = 20
  p.stock_quantity = 25
end

# Create a Product object that is missing some required columns
product4 = Product.create do |p|
  p.name = "Product 4"
end

# Print all the AR errors generated for the invalid product
if product4.valid?
  product4.save
  puts "Product '#{product4.name}' has been saved successfully."
else
  puts "Errors occurred while saving the invalid product:"
  product4.errors.full_messages.each do |error_message|
    puts error_message
  end
end