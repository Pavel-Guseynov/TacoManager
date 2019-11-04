# frozen_string_literal: true

require 'test_helper'

class ManagerTokenControllerTest < ActionDispatch::IntegrationTest
  setup do
    @password = Faker::Crypto.md5
    @manager = create(:manager, password: @password)
  end

  test 'manager should auth' do
    post manager_auth_url, params: { auth: { email: @manager.email, password: @password } }, as: :json
    assert_response :success
  end
end
