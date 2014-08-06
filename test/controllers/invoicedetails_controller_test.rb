require 'test_helper'

class InvoicedetailsControllerTest < ActionController::TestCase
  setup do
    @invoicedetail = invoicedetails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invoicedetails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invoicedetail" do
    assert_difference('Invoicedetail.count') do
      post :create, invoicedetail: { end_date: @invoicedetail.end_date, invoice_id: @invoicedetail.invoice_id, project_id: @invoicedetail.project_id, release_date: @invoicedetail.release_date, status: @invoicedetail.status }
    end

    assert_redirected_to invoicedetail_path(assigns(:invoicedetail))
  end

  test "should show invoicedetail" do
    get :show, id: @invoicedetail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invoicedetail
    assert_response :success
  end

  test "should update invoicedetail" do
    patch :update, id: @invoicedetail, invoicedetail: { end_date: @invoicedetail.end_date, invoice_id: @invoicedetail.invoice_id, project_id: @invoicedetail.project_id, release_date: @invoicedetail.release_date, status: @invoicedetail.status }
    assert_redirected_to invoicedetail_path(assigns(:invoicedetail))
  end

  test "should destroy invoicedetail" do
    assert_difference('Invoicedetail.count', -1) do
      delete :destroy, id: @invoicedetail
    end

    assert_redirected_to invoicedetails_path
  end
end
