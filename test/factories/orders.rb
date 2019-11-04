# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    taco
    piquancy { Faker::Number.within(range: 100..10_000) }
  end
end
