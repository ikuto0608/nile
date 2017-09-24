require 'test_helper'

class RequestDeliveriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @request_delivery = request_deliveries(:one)
  end

  test "should get index" do
    get request_deliveries_url
    assert_response :success
  end

  test "should get new" do
    get new_request_delivery_url
    assert_response :success
  end

  test "should create request_delivery" do
    assert_difference('RequestDelivery.count') do
      post request_deliveries_url, params: { request_delivery: {  } }
    end

    assert_redirected_to request_delivery_url(RequestDelivery.last)
  end

  test "should show request_delivery" do
    get request_delivery_url(@request_delivery)
    assert_response :success
  end

  test "should get edit" do
    get edit_request_delivery_url(@request_delivery)
    assert_response :success
  end

  test "should update request_delivery" do
    patch request_delivery_url(@request_delivery), params: { request_delivery: {  } }
    assert_redirected_to request_delivery_url(@request_delivery)
  end

  test "should destroy request_delivery" do
    assert_difference('RequestDelivery.count', -1) do
      delete request_delivery_url(@request_delivery)
    end

    assert_redirected_to request_deliveries_url
  end
end
