require 'test_helper'

class NewsletterQueuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @newsletter_queue = newsletter_queues(:one)
  end

  test "should get index" do
    get newsletter_queues_url
    assert_response :success
  end

  test "should get new" do
    get new_newsletter_queue_url
    assert_response :success
  end

  test "should create newsletter_queue" do
    assert_difference('NewsletterQueue.count') do
      post newsletter_queues_url, params: { newsletter_queue: { content: @newsletter_queue.content, status: @newsletter_queue.status, subject: @newsletter_queue.subject } }
    end

    assert_redirected_to newsletter_queue_url(NewsletterQueue.last)
  end

  test "should show newsletter_queue" do
    get newsletter_queue_url(@newsletter_queue)
    assert_response :success
  end

  test "should get edit" do
    get edit_newsletter_queue_url(@newsletter_queue)
    assert_response :success
  end

  test "should update newsletter_queue" do
    patch newsletter_queue_url(@newsletter_queue), params: { newsletter_queue: { content: @newsletter_queue.content, status: @newsletter_queue.status, subject: @newsletter_queue.subject } }
    assert_redirected_to newsletter_queue_url(@newsletter_queue)
  end

  test "should destroy newsletter_queue" do
    assert_difference('NewsletterQueue.count', -1) do
      delete newsletter_queue_url(@newsletter_queue)
    end

    assert_redirected_to newsletter_queues_url
  end
end
