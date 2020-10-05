# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

puts "Destroying cocktails"
Cocktail.destroy_all
puts "Destroying ingredients"
Ingredient.destroy_all

puts "Creating Ingredients"
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
file = open(url).read
cocktails = JSON.parse(file)
drinks = cocktails["drinks"]
drinks.each do |drink|
    Ingredient.create(name: drink["strIngredient1"])
end

puts "Creating Cocktails"
file = URI.open('https://images.unsplash.com/photo-1598373187432-c1ff06874ce8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')
cocktail = Cocktail.new(name: 'Madame Butterfly')
cocktail.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')


