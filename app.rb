require 'json'
require_relative 'models/recipe'

hash = JSON.parse(File.read('recipes.json'))


# p hash[0]['ingredients'][2]['name']

array_of_recipes = []
hash.each do |recipe|
    array_of_recipes << Recipe.new(recipe)
end

first_recipe = Recipe.new(hash[0])

first_recipe.time
