require 'test_helper'

class BusinessownersControllerTest < ActionController::TestCase
  setup do
    @businessowner = businessowners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:businessowners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create businessowner" do
    assert_difference('Businessowner.count') do
      post :create, businessowner: { company_name: @businessowner.company_name, company_website: @businessowner.company_website, email: @businessowner.email, event_id: @businessowner.event_id, password: @businessowner.password, phone: @businessowner.phone }
    end

    assert_redirected_to businessowner_path(assigns(:businessowner))
  end

  test "should show businessowner" do
    get :show, id: @businessowner
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @businessowner
    assert_response :success
  end

  test "should update businessowner" do
    patch :update, id: @businessowner, businessowner: { company_name: @businessowner.company_name, company_website: @businessowner.company_website, email: @businessowner.email, event_id: @businessowner.event_id, password: @businessowner.password, phone: @businessowner.phone }
    assert_redirected_to businessowner_path(assigns(:businessowner))
  end

  test "should destroy businessowner" do
    assert_difference('Businessowner.count', -1) do
      delete :destroy, id: @businessowner
    end

    assert_redirected_to businessowners_path
  end
end
