require 'json'
require_relative 'models/recipe'
require 'rainbow'
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
    puts "Please select from the following recipes: "
    puts "-----------------------------------"
    @number = 1
    @numbers_array = [1]
        @array_of_recipes.each do |i| 
            # p "#{number} #{i.name}"
            puts "#{@number}" + "."" #{i.name}"
            @number += 1
            @numbers_array << @number

        end
        @numbers_array.pop
end

def print_recipe
    puts "Please select from the following recipes: "
    puts "------------------------------"
end

def recipe_select
    puts "What is your selection?"
    selection = gets.to_i
    system "clear"
        @numbers_array.each do |number|
        if number == selection
            selection -= 1
            puts "You selected: #{@array_of_recipes[selection].name}! Correct? (y/n)"
            yes_no = gets.chomp
            if yes_no == "y"
                puts "Ok! Let's get cook it!"
            elsif yes_no == "n"
                system "clear"
                print_recipe_names
                puts "------------------------------------"
                recipe_select
            else
                system "clear"
                puts Rainbow("Invalid Selection.  Please try again").red
                print_recipe_names
                puts "------------------------------------"
                recipe_select
            end
        elsif selection > @numbers_array.length
            system "clear"
            puts Rainbow("Invalid Selection.  Please try again").red
            print_recipe_names
            puts "------------------------------------"
            recipe_select
        end
    end
end

welcome

# puts "Please select from the following recipes: "
# puts "-----------------------------------"
print_recipe_names
puts "------------------------------------"
recipe_select

