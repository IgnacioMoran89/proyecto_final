require 'test_helper'

class ShopProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shop_profile = shop_profiles(:one)
  end

  test "should get index" do
    get shop_profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_shop_profile_url
    assert_response :success
  end

  test "should create shop_profile" do
    assert_difference('ShopProfile.count') do
      post shop_profiles_url, params: { shop_profile: { address: @shop_profile.address, comment: @shop_profile.comment, description: @shop_profile.description, name: @shop_profile.name, phone: @shop_profile.phone, rating: @shop_profile.rating, user_id: @shop_profile.user_id } }
    end

    assert_redirected_to shop_profile_url(ShopProfile.last)
  end

  test "should show shop_profile" do
    get shop_profile_url(@shop_profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_shop_profile_url(@shop_profile)
    assert_response :success
  end

  test "should update shop_profile" do
    patch shop_profile_url(@shop_profile), params: { shop_profile: { address: @shop_profile.address, comment: @shop_profile.comment, description: @shop_profile.description, name: @shop_profile.name, phone: @shop_profile.phone, rating: @shop_profile.rating, user_id: @shop_profile.user_id } }
    assert_redirected_to shop_profile_url(@shop_profile)
  end

  test "should destroy shop_profile" do
    assert_difference('ShopProfile.count', -1) do
      delete shop_profile_url(@shop_profile)
    end

    assert_redirected_to shop_profiles_url
  end
end
