require "application_system_test_case"

class ShopProfilesTest < ApplicationSystemTestCase
  setup do
    @shop_profile = shop_profiles(:one)
  end

  test "visiting the index" do
    visit shop_profiles_url
    assert_selector "h1", text: "Shop Profiles"
  end

  test "creating a Shop profile" do
    visit shop_profiles_url
    click_on "New Shop Profile"

    fill_in "Address", with: @shop_profile.address
    fill_in "Comment", with: @shop_profile.comment
    fill_in "Description", with: @shop_profile.description
    fill_in "Name", with: @shop_profile.name
    fill_in "Phone", with: @shop_profile.phone
    fill_in "Rating", with: @shop_profile.rating
    fill_in "User", with: @shop_profile.user_id
    click_on "Create Shop profile"

    assert_text "Shop profile was successfully created"
    click_on "Back"
  end

  test "updating a Shop profile" do
    visit shop_profiles_url
    click_on "Edit", match: :first

    fill_in "Address", with: @shop_profile.address
    fill_in "Comment", with: @shop_profile.comment
    fill_in "Description", with: @shop_profile.description
    fill_in "Name", with: @shop_profile.name
    fill_in "Phone", with: @shop_profile.phone
    fill_in "Rating", with: @shop_profile.rating
    fill_in "User", with: @shop_profile.user_id
    click_on "Update Shop profile"

    assert_text "Shop profile was successfully updated"
    click_on "Back"
  end

  test "destroying a Shop profile" do
    visit shop_profiles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Shop profile was successfully destroyed"
  end
end
