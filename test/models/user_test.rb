require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "when user is enrolled" do
    user = FactoryGirl.create(:user)
    course = FactoryGirl.create(:course)
    enrollment = FactoryGirl.create(:enrollment, user: user, course: course)

    assert user.enrolled_in?(course)
  end
  test "when user is not enrolled" do
    user = FactoryGirl.create(:user)
    course = FactoryGirl.create(:course)

    assert_not user.enrolled_in?(course)
  end
end