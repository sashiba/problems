require 'test_helper'

class SolutionTest < ActiveSupport::TestCase
  def setup
    @solution = solutions(:test_solution)
    @wrong_solution = solutions(:test_solution_wrong)
  end

  test "should be valid" do
    assert @solution.valid?
  end

  test "should not be valid without present content" do
    @solution.content = ' '
    assert_not @solution.valid?
  end

  test "should not be valid without present test_status" do
    @solution.test_status = ' '
    assert_not @solution.valid?
  end

  test "should be correct" do
    assert_equal true, @solution.correct?
  end

  test "should not be correct" do
    assert_not @wrong_solution.correct?
  end
end
