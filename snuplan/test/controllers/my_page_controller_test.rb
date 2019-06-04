require 'test_helper'

class MyPageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_page_index_url
    assert_response :success
  end

  test "should get new" do
    get my_page_new_url
    assert_response :success
  end

  test "should get edit" do
    get my_page_edit_url
    assert_response :success
  end

end
