require "test_helper"

class CreateCategoriesListTest < ActionDispatch::IntegrationTest
  
  def setup
    @category1 = Category.create(name:"Food")
    @category2 = Category.create(name:"food")
    
    # byebug
  end


  test "should show categories listing" do
    get '/categories'
    assert_select 'a[href]'
    assert_match @category2.name, response.body
    assert_match @category1.name, response.body
    
  end

end
