require 'test_helper'

class LessonsControllerTest < ActionController::TestCase
  test "require user to login" do
    user = FactoryGirl.create(:user)
    lesson = FactoryGirl.create(:lesson)

    get :show, id: lesson.id
    assert_redirected_to new_user_session_path
  end

  test "require user to be enrolled" do
    user = FactoryGirl.create(:user)
    course = FactoryGirl.create(:course)
    section = FactoryGirl.create(:section, course: course)
    lesson = FactoryGirl.create(:lesson, section: section)
    enrollment = FactoryGirl.create(:enrollment, user: user, course: course)

    sign_in user

    get :show, id: lesson.id
    if user.enrolled_in?(course)
      assert_response :success
      else
        assert_redirected_to course_path(course)
    end

  end
end
