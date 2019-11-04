# frozen_string_literal: true

class TacoIngredient < ApplicationRecord
  belongs_to :taco
  belongs_to :ingredient
  belongs_to :ingredient_group, optional: true

  scope :basic, -> { where(ingredient_group: nil) }
end
