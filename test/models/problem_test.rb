require 'test_helper'

class ProblemTest < ActiveSupport::TestCase
  def setup
    @problem_one = problems(:one)
    @problem_two = problems(:two)
  end

  test "should be solved" do
    assert_equal true, @problem_one.solved?
  end

  test "should not be solved" do
    assert_not @problem_two.solved?
  end
end
