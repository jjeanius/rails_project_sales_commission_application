require 'test_helper'

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get employees_home_url
    assert_response :success
  end

end
