require 'open-uri'
require 'json'

puts "Downloading..."

list = open("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read
drink_list = JSON.parse(list)


drink_list["drinks"].each do |ingredient|
  ingredient = Ingredient.new(
    name: ingredient["strIngredient1"],
  )
  ingredient.save!
end


puts "Done!"
