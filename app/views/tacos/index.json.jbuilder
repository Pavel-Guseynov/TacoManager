# frozen_string_literal: true

json.array! @tacos do |taco|
  json.id taco.id
  json.name taco.name
  json.description taco.description
  json.price taco.price
end
