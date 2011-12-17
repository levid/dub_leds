require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  test "that it GET .index" do
    VCR.use_cassette('controllers/home') do
      get :index, :use_route => :home

      assert_response          :success
      assert_kind_of Array,    assigns(:rims)
      assert_equal :home_path, assigns(:path)
      assert_template 'home'
    end
  end

end
