require 'test_helper'

class ProductSalesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_sale = product_sales(:one)
  end

  test "should get index" do
    get product_sales_url
    assert_response :success
  end

  test "should get new" do
    get new_product_sale_url
    assert_response :success
  end

  test "should create product_sale" do
    assert_difference('ProductSale.count') do
      post product_sales_url, params: { product_sale: { product_id: @product_sale.product_id, qty: @product_sale.qty, value: @product_sale.value } }
    end

    assert_redirected_to product_sale_url(ProductSale.last)
  end

  test "should show product_sale" do
    get product_sale_url(@product_sale)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_sale_url(@product_sale)
    assert_response :success
  end

  test "should update product_sale" do
    patch product_sale_url(@product_sale), params: { product_sale: { product_id: @product_sale.product_id, qty: @product_sale.qty, value: @product_sale.value } }
    assert_redirected_to product_sale_url(@product_sale)
  end

  test "should destroy product_sale" do
    assert_difference('ProductSale.count', -1) do
      delete product_sale_url(@product_sale)
    end

    assert_redirected_to product_sales_url
  end
end
