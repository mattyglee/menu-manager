require 'test_helper'

class OtherItemsControllerTest < ActionController::TestCase
  setup do
    @other_item = other_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:other_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create other_item" do
    assert_difference('OtherItem.count') do
      post :create, other_item: { name: @other_item.name, quantity: @other_item.quantity, shopping_list_id: @other_item.shopping_list_id }
    end

    assert_redirected_to other_item_path(assigns(:other_item))
  end

  test "should show other_item" do
    get :show, id: @other_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @other_item
    assert_response :success
  end

  test "should update other_item" do
    put :update, id: @other_item, other_item: { name: @other_item.name, quantity: @other_item.quantity, shopping_list_id: @other_item.shopping_list_id }
    assert_redirected_to other_item_path(assigns(:other_item))
  end

  test "should destroy other_item" do
    assert_difference('OtherItem.count', -1) do
      delete :destroy, id: @other_item
    end

    assert_redirected_to other_items_path
  end
end
