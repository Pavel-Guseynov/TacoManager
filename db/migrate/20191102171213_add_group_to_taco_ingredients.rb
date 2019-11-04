# frozen_string_literal: true

class AddGroupToTacoIngredients < ActiveRecord::Migration[6.0]
  def change
    add_reference :taco_ingredients, :ingredient_group, type: :string, index: true
  end
end
