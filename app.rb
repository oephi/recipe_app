require 'json'
require_relative 'models/recipe'
require 'rainbow'
require 'terminal-table'
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
    puts " "
    @number = 1
    @numbers_array = [1]
    rows = []
        @array_of_recipes.each do |i| 
            # p "#{number} #{i.name}"
            # puts "#{@number}" + "."" #{i.name}"
            @numbers_array << @number
            rows << [@number, i.name]
            @number += 1
        end
        @numbers_array.pop
        table = Terminal::Table.new :title => "Recipes", :headings => ['Number', 'Name'], :rows => rows
        puts table

end

def return_input(input)
    system "clear"
    puts Rainbow(input).red
    print_recipe_names
    puts "------------------------------------"
    recipe_select
end

def recipe_select
    puts "What is your selection?"
    @selection = gets.to_i
    system "clear"
    @numbers_array.each do |number|
        if number == @selection
            @selection -= 1
            puts "You selected: #{@array_of_recipes[@selection].name}! Correct? (y/n)"
            yes_no = gets.strip
            if yes_no == "y"
                puts "Ok! Let's get cook it!  Please press enter to see ingredients"
                gets
                system "clear"
            elsif yes_no == "n"
                return_input("")
            else
               return_input("Please try again")
            end
            ## Broken, please fix
        elsif @selection > @numbers_array.length || @selection == 0
            return_input("Invalid selection please try again")
        end
    end
end

def display_ingredients
    puts "INGREDIENTS FOR #{@array_of_recipes[@selection].name}"
    puts ""
    input = 0
    table = []
    rows = []
    while input < @array_of_recipes[@selection].ingredients.length 
        # puts @array_of_recipes[@selection].ingredients[input]['quantity'] + " " + @array_of_recipes[@selection].ingredients[input]['name']
        # puts " "
        rows << [@array_of_recipes[@selection].ingredients[input]['quantity'], @array_of_recipes[@selection].ingredients[input]['name']]
        input += 1
    end
    @array_of_recipes[@selection].time
    table = Terminal::Table.new :title => "INGREDIENTS", :headings => ['Number', 'Name'], :rows => rows
    puts table
    puts ""
end

def cooking_steps
    input = 0 
    while input < @array_of_recipes[@selection].steps.length
        if input == 0
            input = 1
        else
            input
        end
        puts "Step #{input} of #{@array_of_recipes[@selection].steps.length - 1}" 
        puts Rainbow(@array_of_recipes[@selection].steps[input]).blue.bg(:white)
        puts ""
        puts "Press enter for next step"    
        gets
        system "clear"
        display_ingredients
        input += 1
    end
    puts Rainbow("Bon apetit!").yellow
end

welcome

print_recipe_names
puts "------------------------------------"
recipe_select
display_ingredients
cooking_steps
