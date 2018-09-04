require 'json'
require_relative 'models/recipe'
# require_relative 'logic'

hash = JSON.parse(File.read('recipes.json'))


# p hash[0]['ingredients'][2]['name']
@array_of_recipes = []
hash.each do |recipe|
    @array_of_recipes << Recipe.new(recipe)
end

def welcome
    system "clear"
    puts "Welcome to the Cooking App, home chefs!"
    puts "------------------------------------"
    puts "Please enter to continue"
    gets
    system "clear"
end

def print_recipe_names
    number = 1
    @array_of_recipes.each do |i| 
        # p "#{number} #{i.name}"
        puts "#{number}" + "."" #{i.name}"
        number += 1
    end
end

def print_recipe
    puts "Please select from the following recipes: "
    puts "------------------------------"
end

def recipe_select
    puts "What is your selection?"
    selection = gets.chomp
end

welcome

puts "Please select from the following recipes: "
puts "-----------------------------------"
print_recipe_names
puts "------------------------------------"
recipe_select