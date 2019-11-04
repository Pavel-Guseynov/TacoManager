# frozen_string_literal: true

FactoryBot.define do
  factory :taco do
    name { Faker::Food.dish }
    description { Faker::Food.description }
    price { Faker::Number.decimal(l_digits: 3, r_digits: 2) }

    transient do
      ingredients_count { 5 }
    end

    after(:create) do |taco, evaluator|
      create_list(:ingredient, evaluator.ingredients_count, tacos: [taco])

      group = create :ingredient_group

      grouped_ingredients = create_list(:ingredient, evaluator.ingredients_count, tacos: [taco])
      grouped_ingredients.each do |ingredient|
        ti = ingredient.taco_ingredients.first
        ti.ingredient_group = group
        ti.save!
      end

      # i.taco_ingredients.first.ingredient_group = group
      # i.save!
      # create_list(:ingredient, evaluator.ingredients_count, tacos: [taco], ingredient_groups: [group])
    end
  end
end
