require 'test_helper'

class AcquisitionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @acquisition = acquisitions(:one)
  end

  test "should get index" do
    get acquisitions_url
    assert_response :success
  end

  test "should get new" do
    get new_acquisition_url
    assert_response :success
  end

  test "should create acquisition" do
    assert_difference('Acquisition.count') do
      post acquisitions_url, params: { acquisition: { date: @acquisition.date, value: @acquisition.value } }
    end

    assert_redirected_to acquisition_url(Acquisition.last)
  end

  test "should show acquisition" do
    get acquisition_url(@acquisition)
    assert_response :success
  end

  test "should get edit" do
    get edit_acquisition_url(@acquisition)
    assert_response :success
  end

  test "should update acquisition" do
    patch acquisition_url(@acquisition), params: { acquisition: { date: @acquisition.date, value: @acquisition.value } }
    assert_redirected_to acquisition_url(@acquisition)
  end

  test "should destroy acquisition" do
    assert_difference('Acquisition.count', -1) do
      delete acquisition_url(@acquisition)
    end

    assert_redirected_to acquisitions_url
  end
end
