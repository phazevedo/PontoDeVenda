require 'test_helper'

class AcquisitionProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @acquisition_product = acquisition_products(:one)
  end

  test "should get index" do
    get acquisition_products_url
    assert_response :success
  end

  test "should get new" do
    get new_acquisition_product_url
    assert_response :success
  end

  test "should create acquisition_product" do
    assert_difference('AcquisitionProduct.count') do
      post acquisition_products_url, params: { acquisition_product: { product_id: @acquisition_product.product_id, qty: @acquisition_product.qty, value: @acquisition_product.value } }
    end

    assert_redirected_to acquisition_product_url(AcquisitionProduct.last)
  end

  test "should show acquisition_product" do
    get acquisition_product_url(@acquisition_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_acquisition_product_url(@acquisition_product)
    assert_response :success
  end

  test "should update acquisition_product" do
    patch acquisition_product_url(@acquisition_product), params: { acquisition_product: { product_id: @acquisition_product.product_id, qty: @acquisition_product.qty, value: @acquisition_product.value } }
    assert_redirected_to acquisition_product_url(@acquisition_product)
  end

  test "should destroy acquisition_product" do
    assert_difference('AcquisitionProduct.count', -1) do
      delete acquisition_product_url(@acquisition_product)
    end

    assert_redirected_to acquisition_products_url
  end
end
