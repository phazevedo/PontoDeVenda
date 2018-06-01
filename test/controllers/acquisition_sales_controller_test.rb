require 'test_helper'

class AcquisitionSalesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @acquisition_sale = acquisition_sales(:one)
  end

  test "should get index" do
    get acquisition_sales_url
    assert_response :success
  end

  test "should get new" do
    get new_acquisition_sale_url
    assert_response :success
  end

  test "should create acquisition_sale" do
    assert_difference('AcquisitionSale.count') do
      post acquisition_sales_url, params: { acquisition_sale: { product_id: @acquisition_sale.product_id, qty: @acquisition_sale.qty, value: @acquisition_sale.value } }
    end

    assert_redirected_to acquisition_sale_url(AcquisitionSale.last)
  end

  test "should show acquisition_sale" do
    get acquisition_sale_url(@acquisition_sale)
    assert_response :success
  end

  test "should get edit" do
    get edit_acquisition_sale_url(@acquisition_sale)
    assert_response :success
  end

  test "should update acquisition_sale" do
    patch acquisition_sale_url(@acquisition_sale), params: { acquisition_sale: { product_id: @acquisition_sale.product_id, qty: @acquisition_sale.qty, value: @acquisition_sale.value } }
    assert_redirected_to acquisition_sale_url(@acquisition_sale)
  end

  test "should destroy acquisition_sale" do
    assert_difference('AcquisitionSale.count', -1) do
      delete acquisition_sale_url(@acquisition_sale)
    end

    assert_redirected_to acquisition_sales_url
  end
end
