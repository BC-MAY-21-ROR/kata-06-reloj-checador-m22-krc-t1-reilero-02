require 'test_helper'

class EmployeeControllerTest < ActionDispatch::IntegrationTest
  test 'should get hello' do
    get employee_hello_url
    assert_response :success
  end
end
