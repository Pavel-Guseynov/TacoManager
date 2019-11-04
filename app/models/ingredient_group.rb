# frozen_string_literal: true

class IngredientGroup < ApplicationRecord
  has_many :taco_ingredients, dependent: :restrict_with_exception
  has_many :ingredients, through: :taco_ingredients

  validates :name, presence: true

  def cheapest_ingredient
    ingredients.order('ingredients.price ASC').first
  end
end
