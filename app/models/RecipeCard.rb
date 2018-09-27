class RecipeCard
    attr_reader :date, :rating, :user, :recipe

    @@all = []

    def initialize(recipe, date, rating, user)
        @date = Date.parse(date)
        @rating = rating
        @user = user 
        @recipe = recipe 
        @@all << self
    end 

    def self.all 
        @@all 
    end 

   

end