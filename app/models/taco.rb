# frozen_string_literal: true

class Taco < ApplicationRecord
  has_many :taco_ingredients, dependent: :destroy
  has_many :ingredients, through: :taco_ingredients
  has_many :basic_ingredients, -> { merge(TacoIngredient.basic) }, through: :taco_ingredients, source: :ingredient
  has_many :ingredient_groups, -> { distinct }, through: :taco_ingredients

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
end
