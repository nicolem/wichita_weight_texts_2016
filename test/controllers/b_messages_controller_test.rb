require 'test_helper'

class BMessagesControllerTest < ActionController::TestCase
  setup do
    @b_message = b_messages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:b_messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create b_message" do
    assert_difference('BMessage.count') do
      post :create, b_message: { text: @b_message.text }
    end

    assert_redirected_to b_message_path(assigns(:b_message))
  end

  test "should show b_message" do
    get :show, id: @b_message
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @b_message
    assert_response :success
  end

  test "should update b_message" do
    patch :update, id: @b_message, b_message: { text: @b_message.text }
    assert_redirected_to b_message_path(assigns(:b_message))
  end

  test "should destroy b_message" do
    assert_difference('BMessage.count', -1) do
      delete :destroy, id: @b_message
    end

    assert_redirected_to b_messages_path
  end
end
