require 'test_helper'

class EnrollmentsControllerTest < ActionController::TestCase
  test "create enrollment" do
    user = FactoryGirl.create(:user)
    sign_in user
    course = FactoryGirl.create(:course)

    assert_difference 'user.enrollments.count' do
      post :create, course_id: course.id
    end

    assert_redirected_to course_path(course)
    assert_equal 1, user.enrollments.count
  end
end
