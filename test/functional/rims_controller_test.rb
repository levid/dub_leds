require 'test_helper'

class RimsControllerTest < ActionController::TestCase

  test "that it GET .index" do
    VCR.use_cassette('controllers/rims') do
      get :index, :use_route => :rim

      assert_response               :success
      assert_kind_of Array,         assigns(:rims)
      assert_equal :rim_path,       assigns(:path)
      assert_template 'rims'
    end
  end

  test "that it GET .new" do
    VCR.use_cassette('controllers/rims') do
      get :new, :id => '4eeeca5041ecfe66d700004d', :use_route => :rim_new

      assert_response               :success
      assert_kind_of Rim,           assigns(:rim)
      assert_template 'new'
    end
  end

  test "that it GET .show" do
    VCR.use_cassette('controllers/rims') do
      get :show, :id => '4eeeca5041ecfe66d700004d', :use_route => :rim_show

      assert_response :success
      assert_kind_of Rim,           assigns(:rim)
      assert_template 'show'
    end
  end

  test "that it GET .edit" do
    VCR.use_cassette('controllers/rims') do
      get :edit, :id => '4eeeca5041ecfe66d700004d', :use_route => :rim_edit

      assert_response :success
      assert_kind_of Rim,           assigns(:rim)
      assert_template 'edit'
    end
  end

  test "that it POST .create" do
    VCR.use_cassette('controllers/rims') do
      post :create, :id => '4eeeca5041ecfe66d700004d', :rim => { :title => 'test', :description => 'test description',
                              :color => 'test', :size => '22', :fitting => '22x10' }, :use_route => :rim_create

      assert_equal 'Rim successfully created.', flash[:notice]
      assert_redirected_to :controller => 'rims', :action => 'show', :id => assigns(:rim).id
    end
  end

  test "that it fails with bad POST .create" do
    VCR.use_cassette('controllers/rims') do
      post :create, :id => '4eeeca5041ecfe66d700004d', :rim => { :title => 'test' }, :use_route => :rim_create

      assert_equal nil, flash[:error]
      assert_redirected_to :controller => 'rims', :action => 'show', :id => assigns(:rim).id
    end
  end

  test "that it PUT .update" do
    VCR.use_cassette('controllers/rims') do
      put :update, :id => '4eeeca5041ecfe66d700004d', :rim => { :title => 'test' }, :use_route => :rim_update

      assert_kind_of Rim,          assigns(:rim)
      assert_equal 1,              assigns(:rim).id
      assert_equal 'Rim 1',        assigns(:rim).title

      assert_equal 'Rim was successfully updated.', flash[:success]
      assert_redirected_to :controller => 'rims', :action => 'show', :id => assigns(:rim).id
    end
  end

  test "that it fails with bad PUT .update" do
    VCR.use_cassette('controllers/rims') do
      Rim.any_instance.expects(:update_attributes).with(anything).returns(false)
      put :update, :id => '4eeeca5041ecfe66d700004d', :rim => { :title => 'test' }, :use_route => :rim_update

      assert_kind_of Rim,         assigns(:rim)
      assert_equal 1,             assigns(:rim).id
      assert_equal 'Rim 1',       assigns(:rim).title

      assert_equal '',            flash[:error]
      assert_redirected_to :controller => 'rims', :action => 'show', :id => assigns(:rim).id
    end
  end

  test "that it DELETE .destroy" do
    VCR.use_cassette('controllers/rims') do
      delete :destroy, :id => '4eeeca5041ecfe66d700004d', :use_route => :rim_destroy

      assert_kind_of Rim,         assigns(:rim)
      assert_equal 1,             assigns(:rim).id
      assert_equal 'Rim was removed',           flash[:success]
      assert_redirected_to :controller => 'rims', :action => 'index'
    end
  end

  test "that it fails with bad DELETE .destroy" do
    VCR.use_cassette('controllers/rims') do
      Rim.any_instance.expects(:destroy).with(anything).returns(false)
      delete :destroy, :id => '4eeeca5041ecfe66d700004d', :use_route => :rim_destroy

      assert_kind_of Rim,         assigns(:rim)
      assert_equal 1,             assigns(:rim).id
      assert_equal "",            flash[:error]
      assert_redirected_to :controller => 'rims', :action => 'show', :id => assigns(:rim).id
    end
  end

end
