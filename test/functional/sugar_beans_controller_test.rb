require 'test_helper'

class SugarBeansControllerTest < ActionController::TestCase
  test "should route root to home page" do
    # check root_path redirects to these parameters
    # adapted from http://www.derekhammer.com/2011/02/19/root-route-testing-in-rails.html
    opts = { :controller => 'sugar_beans', :action => 'list', :module => 'accounts'}
    assert_recognizes opts, '/'
  end

  test "should get accounts#list" do
    get(:list, {:module => "accounts"})
    assert_response :success
  end
  
  test "should get users/1" do
    get(:show, {:module => "users", :id => "1"})
    assert_equal SugarCRM::User.find(1), assigns(@bean)["bean"]
    assert_response :success
  end
  
  test "should render available modules on invalid module param" do
    get(:list, {:module => "kittens"})
    assert_template 'available_modules'
  end
  
end
