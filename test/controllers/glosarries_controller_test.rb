require 'test_helper'

class GlosarriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @glosarry = glosarries(:one)
  end

  test "should get index" do
    get glosarries_url
    assert_response :success
  end

  test "should get new" do
    get new_glosarry_url
    assert_response :success
  end

  test "should create glosarry" do
    assert_difference('Glosarry.count') do
      post glosarries_url, params: { glosarry: { description: @glosarry.description, title: @glosarry.title } }
    end

    assert_redirected_to glosarry_url(Glosarry.last)
  end

  test "should show glosarry" do
    get glosarry_url(@glosarry)
    assert_response :success
  end

  test "should get edit" do
    get edit_glosarry_url(@glosarry)
    assert_response :success
  end

  test "should update glosarry" do
    patch glosarry_url(@glosarry), params: { glosarry: { description: @glosarry.description, title: @glosarry.title } }
    assert_redirected_to glosarry_url(@glosarry)
  end

  test "should destroy glosarry" do
    assert_difference('Glosarry.count', -1) do
      delete glosarry_url(@glosarry)
    end

    assert_redirected_to glosarries_url
  end
end
