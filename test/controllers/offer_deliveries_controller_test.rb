require 'test_helper'

class OfferDeliveriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @offer_delivery = offer_deliveries(:one)
  end

  test "should get index" do
    get offer_deliveries_url
    assert_response :success
  end

  test "should get new" do
    get new_offer_delivery_url
    assert_response :success
  end

  test "should create offer_delivery" do
    assert_difference('OfferDelivery.count') do
      post offer_deliveries_url, params: { offer_delivery: {  } }
    end

    assert_redirected_to offer_delivery_url(OfferDelivery.last)
  end

  test "should show offer_delivery" do
    get offer_delivery_url(@offer_delivery)
    assert_response :success
  end

  test "should get edit" do
    get edit_offer_delivery_url(@offer_delivery)
    assert_response :success
  end

  test "should update offer_delivery" do
    patch offer_delivery_url(@offer_delivery), params: { offer_delivery: {  } }
    assert_redirected_to offer_delivery_url(@offer_delivery)
  end

  test "should destroy offer_delivery" do
    assert_difference('OfferDelivery.count', -1) do
      delete offer_delivery_url(@offer_delivery)
    end

    assert_redirected_to offer_deliveries_url
  end
end
