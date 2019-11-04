# frozen_string_literal: true

json.id @taco.id
json.name @taco.name
json.description @taco.description
json.price @taco.price

json.ingredients @taco.basic_ingredients do |ingredient|
  json.name ingredient.name
end

json.ingredient_groups @taco.ingredient_groups do |ingredient_group|
  json.id ingredient_group.id
  json.name ingredient_group.name
  json.ingredients ingredient_group.ingredients do |ingredient|
    json.id ingredient.id
    json.name ingredient.name
    json.price ingredient.extra_price_in_group(ingredient_group)
  end
end
