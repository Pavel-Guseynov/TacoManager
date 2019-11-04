# frozen_string_literal: true

FactoryBot.define do
  factory :manager do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Crypto.md5 }
  end
end
