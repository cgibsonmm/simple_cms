require 'test_helper'

class DemoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get demo_index_url
    assert_response :success
    assert_select "title", "SimpleCms | Index"
  end

  test "Should get hello" do
    get demo_hello_url
    assert_response :success
    assert_select 'title', 'SimpleCms | Hello'
  end
end
