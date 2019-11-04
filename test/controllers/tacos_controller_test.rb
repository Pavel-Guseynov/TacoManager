# frozen_string_literal: true

require 'test_helper'

class TacosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @taco = create :taco
  end

  test 'should get taco index' do
    get tacos_url, as: :json
    assert_response :success
  end

  test 'should show taco' do
    get taco_url(@taco), as: :json
    assert_response :success
  end
end
