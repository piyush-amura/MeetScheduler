require 'test_helper'

class Users::Admins::MeetingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_admins_meetings_new_url
    assert_response :success
  end

  test "should get edit" do
    get users_admins_meetings_edit_url
    assert_response :success
  end

  test "should get index" do
    get users_admins_meetings_index_url
    assert_response :success
  end

end
