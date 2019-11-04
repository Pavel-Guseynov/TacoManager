# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_02_183330) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ingredient_groups", id: :string, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ingredients", id: :string, force: :cascade do |t|
    t.string "name"
    t.decimal "price", precision: 16, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "managers", id: :string, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", id: :string, force: :cascade do |t|
    t.string "aasm_state"
    t.string "manager_id"
    t.string "taco_id"
    t.integer "piquancy"
    t.jsonb "ingredient_options"
    t.decimal "price", precision: 16, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["manager_id"], name: "index_orders_on_manager_id"
    t.index ["taco_id"], name: "index_orders_on_taco_id"
  end

  create_table "taco_ingredients", id: :string, force: :cascade do |t|
    t.string "taco_id"
    t.string "ingredient_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "ingredient_group_id"
    t.index ["ingredient_group_id"], name: "index_taco_ingredients_on_ingredient_group_id"
    t.index ["ingredient_id"], name: "index_taco_ingredients_on_ingredient_id"
    t.index ["taco_id"], name: "index_taco_ingredients_on_taco_id"
  end

  create_table "tacos", id: :string, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price", precision: 16, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
