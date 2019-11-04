# frozen_string_literal: true

FactoryBot.define do
  factory :ingredient do
    name { Faker::Food.ingredient }
    price { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
  end
end
