require 'test_helper'

class CMessagesControllerTest < ActionController::TestCase
  setup do
    @c_message = c_messages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:c_messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create c_message" do
    assert_difference('CMessage.count') do
      post :create, c_message: { text: @c_message.text }
    end

    assert_redirected_to c_message_path(assigns(:c_message))
  end

  test "should show c_message" do
    get :show, id: @c_message
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @c_message
    assert_response :success
  end

  test "should update c_message" do
    patch :update, id: @c_message, c_message: { text: @c_message.text }
    assert_redirected_to c_message_path(assigns(:c_message))
  end

  test "should destroy c_message" do
    assert_difference('CMessage.count', -1) do
      delete :destroy, id: @c_message
    end

    assert_redirected_to c_messages_path
  end
end
