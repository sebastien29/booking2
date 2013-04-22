require 'test_helper'
require 'factory_girl'

class VehiculesControllerTest < ActionController::TestCase
  #setup do
    #@vehicule = vehicules(:one)
  #end

  FactoryGirl.define do
    factory :vehicule do
      plaque '1234567'
    end
  end

  test "should get index" do
    FactoryGirl.create(:vehicule, plaque: "AZAZAZA")
    FactoryGirl.create(:vehicule, plaque: "AZAZA3Z")
    FactoryGirl.create(:vehicule, plaque: "AZAZAZE")

    get :index
    assert_response :success

    vehicules = assigns(  :vehicules )

    assert vehicules.size == 3
    assert_select 'tr', 4
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vehicule" do
    post :create, vehicule: { plaque: 123456 }
    assert_response :success


    v = assigns(:vehicule)
    assert_not_nil v.id

    assert_redirected_to vehicule_path( v )
  end

  test "should show vehicule" do
    #get(:show, {'plaque' => '1231111'})
    get :show, id: @vehicule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vehicule
    assert_response :success
  end

  test "should update vehicule" do
    put :update, id: @vehicule, vehicule: { plaque: @vehicule.plaque }
    assert_redirected_to vehicule_path(assigns(:vehicule))
  end

  test "should destroy vehicule" do
    assert_difference('Vehicule.count', -1) do
      delete :destroy, id: @vehicule
    end

    assert_redirected_to vehicules_path
  end
end
