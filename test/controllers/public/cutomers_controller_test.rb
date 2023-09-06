require "test_helper"

class Public::CutomersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_cutomers_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_cutomers_edit_url
    assert_response :success
  end

  test "should get check" do
    get public_cutomers_check_url
    assert_response :success
  end
end
