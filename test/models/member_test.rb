require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  def setup
    @member = Member.new(name: "Bob", email:"mail@mail.com")
  end

  test "membername should be present" do
    @member.name = " "
    assert_not@member.valid?
  end

  test "membername should be unique" do
    @member.save
    @member2 = Member.new(name: "Bob", email:"email@mail.com")
    assert_not @member2.valid?
  end

  test "membername should not be too long" do
    @member.name = "a" * 26
    assert_not @member.valid? 
  end

  test "membername should not be too short" do
    @member.name = "aa"
    assert_not @member.valid? 
  end

end 