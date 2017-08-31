require 'test_helper'

class AgendasControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get agendas_new_url
    assert_response :success
  end

  test "should get edit" do
    get agendas_edit_url
    assert_response :success
  end

  test "should get display" do
    get agendas_display_url
    assert_response :success
  end

end
