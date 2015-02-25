require 'test_helper'

class AccountControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get register" do
    get :register
    assert_response :success
  end

  test "should get fpassword" do
    get :fpassword
    assert_response :success
  end

end
