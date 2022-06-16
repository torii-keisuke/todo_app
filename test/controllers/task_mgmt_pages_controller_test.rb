require "test_helper"

class TaskMgmtPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get task_mgmt_pages_index_url
    assert_response :success
  end
end
