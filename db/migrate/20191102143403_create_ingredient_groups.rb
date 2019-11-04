# frozen_string_literal: true

class CreateIngredientGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredient_groups, id: :string do |t|
      t.string :name

      t.timestamps
    end
  end
end
