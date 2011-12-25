require 'test_helper'

class GeneratorControllerTest < ActionController::TestCase
  test "that it GET index" do
    VCR.use_cassette('controllers/generator') do
      get :index, :use_route => :generator

      assert_response :success
      assert_kind_of Mongoid::Criteria, assigns(:rims)
      assert_equal :generator_path, assigns(:path)
      assert_template 'generator'
    end
  end
end
