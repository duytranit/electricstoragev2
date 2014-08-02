require 'test_helper'

class ProcategoriesControllerTest < ActionController::TestCase
  setup do
    @procategory = procategories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:procategories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create procategory" do
    assert_difference('Procategory.count') do
      post :create, procategory: { name: @procategory.name, status: @procategory.status, user_id: @procategory.user_id }
    end

    assert_redirected_to procategory_path(assigns(:procategory))
  end

  test "should show procategory" do
    get :show, id: @procategory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @procategory
    assert_response :success
  end

  test "should update procategory" do
    patch :update, id: @procategory, procategory: { name: @procategory.name, status: @procategory.status, user_id: @procategory.user_id }
    assert_redirected_to procategory_path(assigns(:procategory))
  end

  test "should destroy procategory" do
    assert_difference('Procategory.count', -1) do
      delete :destroy, id: @procategory
    end

    assert_redirected_to procategories_path
  end
end
