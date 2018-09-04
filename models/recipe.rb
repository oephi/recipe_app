class Recipe
    # def initialize name, ingredients, steps
    #     @name = name
    #     @ingredients = ingredients
    #     @steps = steps    
    # end
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
        p new_time
    end

    def ingredients
        @ingredients
    end


end
