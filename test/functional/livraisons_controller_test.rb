require 'test_helper'
require 'factory_girl'

class LivraisonsControllerTest < ActionController::TestCase
  setup do
    @livraison = livraisons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:livraisons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create livraison" do
    assert_difference('Livraison.count') do
      post :create, :livraison => @livraison
    #post :create, :livraison => { id: @,:adresse => "aba", :id_vehicule => '3'}
    end


    assert_redirected_to livraison_path(assigns(:livraison))
  end

  test "should show livraison" do
    get :show, id: @livraison
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @livraison
    assert_response :success
  end

  test "should update livraison" do
    put :update, id: @livraison, livraison: { adresse: @livraison.adresse, date: @livraison.date }
    assert_redirected_to livraison_path(assigns(:livraison))
  end

  test "should destroy livraison" do
    assert_difference('Livraison.count', -1) do
      delete :destroy, id: @livraison
    end

    assert_redirected_to livraisons_path
  end
end
