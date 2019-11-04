# frozen_string_literal: true

class Ingredient < ApplicationRecord
  has_many :taco_ingredients, dependent: :restrict_with_exception
  has_many :tacos, through: :taco_ingredients
  has_many :ingredient_groups, through: :taco_ingredients

  validates :name, presence: true
  validates :price, presence: true

  def extra_price_in_group(group)
    price - group.cheapest_ingredient.price
  end
end
