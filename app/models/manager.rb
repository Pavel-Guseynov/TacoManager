# frozen_string_literal: true

class Manager < ApplicationRecord
  has_secure_password

  has_many :orders, dependent: :restrict_with_exception

  validates :name, presence: true
  validates :email, presence: true

  scope :freest, -> { joins(:orders).group(:id).order('COUNT(orders.id) DESC') }
end
