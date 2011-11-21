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

  test "that it GET .new" do
    VCR.use_cassette('controllers/home') do
      get :new, :id => 1, :use_route => :home_new
      
      assert_response           :success
      assert_kind_of Rim,       assigns(:rims)
      assert_template 'new'
    end
  end

  test "that it GET .show" do
    VCR.use_cassette('controllers/home') do
      get :show, :id => 1

      assert_response :success
      assert_kind_of Array,     assigns(:rims)
      assert_template 'show'
    end
  end

  test "that it GET .edit" do
    VCR.use_cassette('controllers/home') do
      get :edit, :id => 1

      assert_response :success
      assert_kind_of Rim,       assigns(:rims)
      assert_template 'edit'
    end
  end

  test "that it POST .create" do
    VCR.use_cassette('controllers/home') do
      post :create, :id => 2, :rim => { :title => 'test', :description => 'test description',
                              :color => 'test', :size => '22', :fitting => '22x10' } 

      assert_equal 'Rim successfully created', flash[:success]
      assert_redirected_to :controller => 'home', :action => 'show', :id => assigns(:rims).id
    end
  end

  test "that it fails with bad POST .create" do
    VCR.use_cassette('controllers/home') do
      post :create, :id => 2, :rim => { :title => 'test' }

      assert_equal nil, flash[:error]
      assert_redirected_to :controller => 'home', :action => 'show', :id => assigns(:rims).id
    end
  end

  test "that it PUT .update" do
    VCR.use_cassette('controllers/home') do
      put :update, :id => 1, :rim => { :title => 'test' }

      assert_kind_of Rim,         assigns(:rims)
      assert_equal 1,             assigns(:rims).id
      assert_equal 'test',        assigns(:rims).title

      assert_equal 'Rim was updated', flash[:success]
      assert_redirected_to :controller => 'home', :action => 'show', :id => assigns(:rims).id 
    end
  end

  test "that it fails with bad PUT .update" do
    VCR.use_cassette('controllers/home') do
      Rim.any_instance.expects(:update_attributes).with(anything).returns(false)
      put :update, :id => 1, :rim => { :title => 'test' }

      assert_kind_of Rim,         assigns(:rims)
      assert_equal 1,             assigns(:rims).id
      assert_equal 'Rim 1',       assigns(:rims).title

      assert_equal '',            flash[:error]
      assert_redirected_to :controller => 'home', :action => 'show', :id => assigns(:rims).id 
    end
  end

  test "that it DELETE .destroy" do
    VCR.use_cassette('controllers/home') do
      delete :destroy, :id => 1

      assert_kind_of Rim,         assigns(:rims)
      assert_equal 1,             assigns(:rims).id
      assert_equal 'Rim was removed',           flash[:success]
      assert_redirected_to :controller => 'home', :action => 'show', :id => assigns(:rims).id
    end
  end

  test "that it fails with bad DELETE .destroy" do
    VCR.use_cassette('controllers/home') do
      Rim.any_instance.expects(:save).with(anything).returns(false)
      delete :destroy, :id => 1

      assert_kind_of Rim,         assigns(:rims)
      assert_equal 1,             assigns(:rims).id
      assert_equal "",            flash[:error]
      assert_redirected_to :controller => 'home', :action => 'show', :id => assigns(:rims).id
    end
  end

end
