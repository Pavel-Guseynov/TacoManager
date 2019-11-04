# frozen_string_literal: true

json.array! @orders do |order|
  json.id order.id
  json.manager do
    json.id order.manager.id
    json.name order.manager.name
  end
  json.taco do
    json.id order.taco.id
    json.name order.taco.name
  end
  json.piquancy order.piquancy
  json.state order.aasm_state
  json.price order.price
  json.ingredient_options order.ingredient_options_as_json
end
