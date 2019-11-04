# frozen_string_literal: true

class CreateTacos < ActiveRecord::Migration[6.0]
  def change
    create_table :tacos, id: :string do |t|
      t.string :name
      t.text :description

      t.decimal :price, scale: 2, precision: 16

      t.timestamps
    end
  end
end
