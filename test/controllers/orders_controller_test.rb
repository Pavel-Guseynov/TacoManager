# frozen_string_literal: true

require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @manager = create :manager
    @order = create(:order, manager: @manager)
  end

  def authenticated_header
    token = Knock::AuthToken.new(payload: { sub: @manager.id }).token

    {
      'Authorization': "Bearer #{token}"
    }
  end

  def order_params
    taco = create :taco

    {
      taco_id: taco.id,
      piquancy: Faker::Number.within(range: 100..10_000),
      ingredient_options: [{
        ingredient_group_id: taco.ingredient_groups.first.id,
        ingredient_id: taco.ingredient_groups.first.ingredients.first.id
      }]
    }
  end

  test 'should get index' do
    get orders_url, as: :json, headers: authenticated_header
    assert_response :success
  end

  test 'should create order' do
    assert_difference('Order.count') do
      post orders_url, params: order_params, as: :json
    end

    assert_response 201
  end

  test 'should show order' do
    get order_url(@order), as: :json
    assert_response :success
  end

  test 'should update order' do
    patch order_url(@order), params: order_params, as: :json
    assert_response 200
  end

  test 'should reject order' do
    delete order_url(@order), as: :json

    # FIXME: not updated in test
    # assert_have_state @order, :rejected

    assert_response 204
  end

  test 'should confirm order' do
    get confirm_order_url(@order), as: :json, headers: authenticated_header

    # FIXME: not updated in test
    # assert_have_state @order, :confirmed

    assert_response 200
  end

  test 'should complete order' do
    @order.confirm!

    get complete_order_url(@order), as: :json, headers: authenticated_header

    # FIXME: not updated in test
    # assert_have_state @order, :completed

    assert_response 200
  end
end
