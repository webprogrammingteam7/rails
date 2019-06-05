require 'test_helper'

class MyPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get my_pages_edit_url
    assert_response :success
  end

  test "should get index" do
    get my_pages_index_url
    assert_response :success
  end

  test "should get my_post" do
    get my_pages_my_post_url
    assert_response :success
  end

  test "should get new" do
    get my_pages_new_url
    assert_response :success
  end

end
