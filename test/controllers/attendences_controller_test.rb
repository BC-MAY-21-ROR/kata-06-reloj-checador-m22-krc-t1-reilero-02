require "test_helper"

class AttendencesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get attendences_index_url
    assert_response :success
  end

  test "should get day" do
    get attendences_day_url
    assert_response :success
  end

  test "should get absences" do
    get attendences_absences_url
    assert_response :success
  end
end
