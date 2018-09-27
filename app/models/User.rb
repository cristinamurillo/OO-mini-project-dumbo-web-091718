class User 
    attr_reader :name 
    @@all = []
    
    def initialize(name)
        @name = name 
        @@all << self 
    end

    def self.all
        @@all 
    end

    def recipes 
       array = RecipeCard.all.map do |recipe_card|
            if recipe_card.user == self 
                recipe_card.recipe 
            end
        end
        array.compact 
    end

    def add_recipe_card(recipe, date, rating)
        RecipeCard.new(recipe, date, rating, self)
    end

    def declare_allergen(ingredient)
        Allergen.new(ingredient, self)
    end

    def allergens
        Allergen.all.select do |allergen|
            allergen.user == self 
        end
    end

    def top_three_recipes
        users_recipe_cards = RecipeCard.all.select do |recipe_card|
            recipe_card.user == self 
        end   
        users_recipe_cards.sort_by! do |recipe_card|
            recipe_card.rating 
        end

        users_recipe_cards.first(3) 
    end

    def most_recent_recipe
       array = RecipeCard.all.select do |recipe_card|
        recipe_card.user == self 
       end 

       array.sort_by do |recipe_card|
            recipe_card.date 
        end.last 
    end

    def safe_recipes
        recipes = []
        Recipe.all.each do |recipe|
             recipe.allergens.each do |ingredient|
                self.allergens.each do |allergen|
                    allergen.ingredient == ingredient ? recipes << recipe : nil
                end
            end   
        end
        recipes 
    end

end