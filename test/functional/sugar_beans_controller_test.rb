require 'test_helper'

class SugarBeansControllerTest < ActionController::TestCase
  test "should get accounts#list" do
    get(:list, {:module => "accounts"})
    assert_response :success
  end
  
  test "should get users/1" do
    get(:show, {:module => "users", :id => "1"})
    assert_equal SugarCRM::User.find(1), assigns(@bean)["bean"]
    assert_response :success
  end
end
