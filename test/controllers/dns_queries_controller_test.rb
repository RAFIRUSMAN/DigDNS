require "test_helper"

class DnsQueriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dns_queries_index_url
    assert_response :success
  end

  test "should get create" do
    get dns_queries_create_url
    assert_response :success
  end
end
