require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  def setup
    @group = Group.new(name: "Work")
  end

  test "groupname should be present" do
    @group.name = " "
    assert_not @group.valid?
  end

  test "groupname should be unique" do
    @group.save
    @group2 = Group.new(name: "Work")
    assert_not @group2.valid?
  end

  test "groupname should not be too long" do
    @group.name = "a" * 26
    assert_not @group.valid? 
  end

  test "groupname should not be too short" do
    @group.name = "aa"
    assert_not @group.valid? 
  end
end 