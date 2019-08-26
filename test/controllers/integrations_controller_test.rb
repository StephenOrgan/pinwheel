require 'test_helper'

class IntegrationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @integration = integrations(:one)
  end

  test "should get index" do
    get integrations_url, as: :json
    assert_response :success
  end

  test "should create integration" do
    assert_difference('Integration.count') do
      post integrations_url, params: { integration: { account_id: @integration.account_id, name: @integration.name } }, as: :json
    end

    assert_response 201
  end

  test "should show integration" do
    get integration_url(@integration), as: :json
    assert_response :success
  end

  test "should update integration" do
    patch integration_url(@integration), params: { integration: { account_id: @integration.account_id, name: @integration.name } }, as: :json
    assert_response 200
  end

  test "should destroy integration" do
    assert_difference('Integration.count', -1) do
      delete integration_url(@integration), as: :json
    end

    assert_response 204
  end
end
