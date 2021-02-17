require 'test_helper'
class CategoryTest < ActiveSupport::TestCase


  def setup
    @category =  Category.new(name: "Sports")
  end

  test "Category should be valid" do
    assert @category.valid?
  end


  test "Category should have name" do
    @category.name = " "
    assert_not @category.valid?
  end

  test "Category should have unique name"  do
    @category.save
    @category2 =  Category.new(name: "Sports")
    assert_not @category2.valid?
  end

  test "name should be too long" do
    @category.name = "a"*26
    assert_not @category.valid?
  end

  test "name should be too small" do
    @category.name = "aa"
    assert_not @category.valid?
  end

end