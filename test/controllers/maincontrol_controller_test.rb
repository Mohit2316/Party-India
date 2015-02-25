require 'test_helper'

class MaincontrolControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
