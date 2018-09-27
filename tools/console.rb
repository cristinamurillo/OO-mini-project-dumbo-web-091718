require 'date'
require_relative '../config/environment.rb'

user1 = User.new("steven")
user2 = User.new("cristina")

fried_eggs = Recipe.new("fried eggs")
chicken_wings = Recipe.new("chicken wings")
pizza = Recipe.new("pizza")
sandwich = Recipe.new("sandwich")

egg = Ingredient.new("egg")
salt = Ingredient.new("salt")
pepper = Ingredient.new("pepper")
chicken = Ingredient.new("chicken")
butter = Ingredient.new("butter")
lettuce = Ingredient.new("lettuce")
bread = Ingredient.new("bread")

allergen1 = Allergen.new(butter, user1)
allergen2 = Allergen.new(pepper, user2)
allergen3 = Allergen.new(pepper, user1)

ri1 = RecipeIngredient.new(fried_eggs, egg)
ri2 = RecipeIngredient.new(fried_eggs, salt)
ri3 = RecipeIngredient.new(fried_eggs, pepper)
ri4 = RecipeIngredient.new(chicken_wings, chicken)
ri5 = RecipeIngredient.new(chicken_wings, butter)
ri6 = RecipeIngredient.new(sandwich, lettuce)
ri7 = RecipeIngredient.new(sandwich, bread)

card1 = RecipeCard.new(fried_eggs, "2015-08-02", 5, user1)
card2 = RecipeCard.new(chicken_wings, "2018-03-07", 4, user1)
card3 = RecipeCard.new(pizza, "2015-12-12", 4, user2)
card4 = RecipeCard.new(sandwich, "2018-08-29", 3, user2)
card5 = RecipeCard.new(fried_eggs, "2017-07-04", 5, user2)

binding.pry
