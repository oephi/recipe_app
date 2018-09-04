require 'json'
require_relative 'models/recipe'
require_relative 'app'
hash = JSON.parse(File.read('recipes.json'))

def welcome
    puts "Welcome to the Cooking App, home chefs!"
    puts "Please select from the following recipes: "
end

def print_recipe_names
    @array_of_recipes.each do |i|
        puts i
    end
end

def recipe_list
    puts "#{print_recipe_names}"
end

recipe_list