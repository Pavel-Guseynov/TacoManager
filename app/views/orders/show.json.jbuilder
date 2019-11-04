# frozen_string_literal: true

json.id @order.id
json.taco_id @order.taco_id
json.piquancy @order.piquancy
json.state @order.aasm_state
json.ingredient_options @order.ingredient_options
