class Ingredient
    attr_reader :name 

    @@all = []

    def initialize(name)
        @name = name 
        @@all << self
    end 

    def self.all 
        @@all 
    end 

    def self.most_common_allergen 
        max = 0
        common_allergen_ingredient = ""
        Ingredient.all.each do |ingredient| 
            users_allergic = 0
            Allergen.all.each do |allergen|
                if allergen.ingredient == ingredient 
                    users_allergic+=1
                end
            end
            if users_allergic > max
                max = users_allergic
                common_allergen_ingredient = ingredient
            end
        end
        
        common_allergen_ingredient

    end 

end