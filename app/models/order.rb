# frozen_string_literal: true

class Order < ApplicationRecord
  include AASM

  belongs_to :taco
  belongs_to :manager

  before_validation :assign_manager, unless: proc { manager }
  before_save :calculate_price, if: proc { new? }

  validates :piquancy, presence: true

  aasm do
    state :new, initial: true
    state :confirmed
    state :completed
    state :rejected

    event :confirm do
      transitions from: :new, to: :confirmed
    end

    event :reject do
      transitions from: :new, to: :rejected
    end

    event :complete do
      transitions from: :confirmed, to: :completed
    end
  end

  def ingredient_options_as_json
    output = []

    ingredient_options&.each do |option|
      ingredient = Ingredient.find(option['ingredient_id'])
      group = IngredientGroup.find(option['ingredient_group_id'])

      output.push(
        ingredient_group: { id: group.id, name: group.name },
        ingredient: { id: ingredient.id, name: ingredient.name }
      )
    end

    output
  end

  private

  def calculate_price
    new_price = taco.price

    ingredient_options&.each do |option|
      ingredient = Ingredient.find(option['ingredient_id'])
      group = IngredientGroup.find(option['ingredient_group_id'])

      new_price = + ingredient.extra_price_in_group(group)
    end

    self.price = new_price
  end

  def assign_manager
    self.manager = Manager.freest.first
  end
end
