require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test "cost in cents" do
    course = FactoryGirl.create(:course)
    course.cost = 100

    expected = (100 * 100).to_i
    actual = course.cost_in_cents
    assert_equal expected, actual
  end

  test "is free?" do
    course = FactoryGirl.create(:course)
    course.cost = 0

    assert course.free?
  end
end
