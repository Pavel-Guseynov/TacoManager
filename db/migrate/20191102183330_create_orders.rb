# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders, id: :string do |t|
      t.string :aasm_state
      t.belongs_to :manager, index: true, type: :string
      t.belongs_to :taco, index: true, type: :string
      t.integer :piquancy
      t.jsonb :ingredient_options
      t.decimal :price, scale: 2, precision: 16

      t.timestamps
    end
  end
end
