class Recipe
    attr_reader :name, :ingredients, :steps
    
    def initialize recipe
        @name = recipe['name']
        @ingredients = recipe['ingredients']
        @steps = recipe['steps']
        @time = recipe['timers']
    end

    def time
        new_time = 0
        @time.each do |i|
            new_time += i
        end
        puts Rainbow("Estimated time for dish is #{new_time} mins").orange
        puts ""
    end

    def ingredients
        @ingredients
    end

    


end
