require 'test_helper'

class LearningModulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @learning_module = learning_modules(:one)
  end

  test "should get index" do
    get learning_modules_url
    assert_response :success
  end

  test "should get new" do
    get new_learning_module_url
    assert_response :success
  end

  test "should create learning_module" do
    assert_difference('LearningModule.count') do
      post learning_modules_url, params: { learning_module: { content: @learning_module.content, custom_posted_by: @learning_module.custom_posted_by, posted_by_id: @learning_module.posted_by_id, slug: @learning_module.slug, title: @learning_module.title } }
    end

    assert_redirected_to learning_module_url(LearningModule.last)
  end

  test "should show learning_module" do
    get learning_module_url(@learning_module)
    assert_response :success
  end

  test "should get edit" do
    get edit_learning_module_url(@learning_module)
    assert_response :success
  end

  test "should update learning_module" do
    patch learning_module_url(@learning_module), params: { learning_module: { content: @learning_module.content, custom_posted_by: @learning_module.custom_posted_by, posted_by_id: @learning_module.posted_by_id, slug: @learning_module.slug, title: @learning_module.title } }
    assert_redirected_to learning_module_url(@learning_module)
  end

  test "should destroy learning_module" do
    assert_difference('LearningModule.count', -1) do
      delete learning_module_url(@learning_module)
    end

    assert_redirected_to learning_modules_url
  end
end
