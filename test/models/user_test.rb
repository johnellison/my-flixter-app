require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user course enrollment" do
    user = FactoryGirl.build(:user)
    course = FactoryGirl.build(:course)
    enrollment = FactoryGirl.build(:enrollment)

    expected =  true
    actual = user.enrolled_in?(course)
    assert_equal expected, actual
  end
end
