require 'test_helper'

class ExpensesControllerTest < ActionDispatch::IntegrationTest
  test "should get resources" do
    get expenses_resources_url
    assert_response :success
  end

end
