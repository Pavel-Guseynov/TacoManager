# frozen_string_literal: true

class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients, id: :string do |t|
      t.string :name

      t.decimal :price, scale: 2, precision: 16

      t.timestamps
    end
  end
end
