require 'test_helper'

class TodoItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get todo_items_index_url
    assert_response :success
  end

  test "should get show" do
    get todo_items_show_url
    assert_response :success
  end

  test "should get new" do
    get todo_items_new_url
    assert_response :success
  end

end
