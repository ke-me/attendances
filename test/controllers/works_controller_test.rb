require "test_helper"

class WorksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get works_index_url
    assert_response :success
  end

  test "should get create" do
    get works_create_url
    assert_response :success
  end

  test "should get update" do
    get works_update_url
    assert_response :success
  end
end
