# frozen_string_literal: true

FactoryBot.define do
  factory :ingredient_group do
    name { Faker::Food.sushi }
  end
end
