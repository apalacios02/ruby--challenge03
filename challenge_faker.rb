# Author: Allan Palacios

load 'ar.rb'

NUMBER_OF_RECORDS = 10

# Create a Faker object for beer styles
faker_beer = Faker::Beer

# Create a Faker object for Doctor Who characters
faker_doctor = Faker::DrWho

# Create a Faker object for Silicon Valley companies
faker_sv = Faker::SiliconValley

# Loop to create new categories
NUMBER_OF_RECORDS.times do
  # Generate a new category (beer style)
  new_category = faker_beer.unique.style

  puts "Creating category: #{new_category}"

  # Save the category data
  saved_category = Category.create(name: new_category)

  # Loop to create new products for each category
  NUMBER_OF_RECORDS.times do
    # Generate a product name (combo of beer, Doctor Who character, and Silicon Valley company)
    new_product_name = "#{faker_beer.name} #{faker_doctor.character}"
    new_product_name += " #{faker_sv.company}#{rand(50)}"

    puts "Creating product: #{new_product_name}"

    # Generate a product description
    prod_description = "#{faker_beer.yeast} #{faker_doctor.catch_phrase}"

    # Create the product record
    the_record = saved_category.products.build(
      name: new_product_name,
      description: prod_description,
      price: rand(25), # Generate a random price
      stock_quantity: rand(50) # Generate a random stock quantity
    )
    the_record.save
  end
end
