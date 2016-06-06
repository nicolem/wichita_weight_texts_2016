require 'test_helper'

class AMessagesControllerTest < ActionController::TestCase
  setup do
    @a_message = a_messages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:a_messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create a_message" do
    assert_difference('AMessage.count') do
      post :create, a_message: { text: @a_message.text }
    end

    assert_redirected_to a_message_path(assigns(:a_message))
  end

  test "should show a_message" do
    get :show, id: @a_message
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @a_message
    assert_response :success
  end

  test "should update a_message" do
    patch :update, id: @a_message, a_message: { text: @a_message.text }
    assert_redirected_to a_message_path(assigns(:a_message))
  end

  test "should destroy a_message" do
    assert_difference('AMessage.count', -1) do
      delete :destroy, id: @a_message
    end

    assert_redirected_to a_messages_path
  end
end
