require "test_helper"

class RsvpsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get rsvps_create_url
    assert_response :success
  end

  test "should get destory" do
    get rsvps_destory_url
    assert_response :success
  end

  test "should get update" do
    get rsvps_update_url
    assert_response :success
  end
end
