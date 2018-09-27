class Recipe 
    attr_reader :name

    @@all = [] 

    def initialize(name)
        @name = name 
    
        @@all << self
    end


    def self.all
        @@all 
    end

    def self.most_popular 
        max = 0
        popular_recipe = nil 
        Recipe.all.each do |recipe|
           recipe_count = RecipeCard.all.count do |recipe_card| 
                recipe == recipe_card.recipe  
            end
            if recipe_count > max 
                max = recipe_count
                popular_recipe = recipe 
            end
        end
        popular_recipe
    end

    def users
        array = RecipeCard.all.map do |recipe_card|
            if recipe_card.recipe == self
                recipe_card.user 
            end   
        end
        array.compact
    end 

    def ingredients 
        recipe_array = RecipeIngredient.all.select do |recipe_ingredient|
            recipe_ingredient.recipe == self 
        end
        recipe_array.map do |recipe_ingredient|
            recipe_ingredient.ingredient 
        end
    end 

    def allergens
        allergens_array = []
        self.ingredients.each do |ingredient|
            Allergen.all.each do |allergen|
                if allergen.ingredient == ingredient
                    allergens_array << ingredient 
                end
            end
        end 
        allergens_array.uniq 

    end 

    def add_ingredients(ingredients)
        ingredients.map do |ingredient|
            RecipeIngredient.new(self, ingredient)
        end
    end 


end