require 'test_helper'

class InvestmentTipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @investment_tip = investment_tips(:one)
  end

  test "should get index" do
    get investment_tips_url
    assert_response :success
  end

  test "should get new" do
    get new_investment_tip_url
    assert_response :success
  end

  test "should create investment_tip" do
    assert_difference('InvestmentTip.count') do
      post investment_tips_url, params: { investment_tip: { content: @investment_tip.content, custom_posted_by: @investment_tip.custom_posted_by, posted_by_id: @investment_tip.posted_by_id, slug: @investment_tip.slug, title: @investment_tip.title } }
    end

    assert_redirected_to investment_tip_url(InvestmentTip.last)
  end

  test "should show investment_tip" do
    get investment_tip_url(@investment_tip)
    assert_response :success
  end

  test "should get edit" do
    get edit_investment_tip_url(@investment_tip)
    assert_response :success
  end

  test "should update investment_tip" do
    patch investment_tip_url(@investment_tip), params: { investment_tip: { content: @investment_tip.content, custom_posted_by: @investment_tip.custom_posted_by, posted_by_id: @investment_tip.posted_by_id, slug: @investment_tip.slug, title: @investment_tip.title } }
    assert_redirected_to investment_tip_url(@investment_tip)
  end

  test "should destroy investment_tip" do
    assert_difference('InvestmentTip.count', -1) do
      delete investment_tip_url(@investment_tip)
    end

    assert_redirected_to investment_tips_url
  end
end
