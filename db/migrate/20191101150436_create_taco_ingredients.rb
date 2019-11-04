# frozen_string_literal: true

class CreateTacoIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :taco_ingredients, id: :string do |t|
      t.belongs_to :taco, index: true, type: :string
      t.belongs_to :ingredient, index: true, type: :string
      t.timestamps
    end
  end
end
