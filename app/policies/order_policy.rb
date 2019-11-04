# frozen_string_literal: true

class OrderPolicy
  attr_reader :user, :order

  def initialize(user, order)
    @user = user
    @order = order
  end

  def update?
    order.new?
  end

  def confirm?
    order.manager_id == user.id
  end

  def complete?
    order.manager_id == user.id
  end
end
