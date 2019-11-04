# frozen_string_literal: true

class CreateManagers < ActiveRecord::Migration[6.0]
  def change
    create_table :managers, id: :string do |t|
      t.string :name
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
