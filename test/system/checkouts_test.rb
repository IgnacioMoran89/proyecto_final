require "application_system_test_case"

class CheckoutsTest < ApplicationSystemTestCase
  setup do
    @checkout = checkouts(:one)
  end

  test "visiting the index" do
    visit checkouts_url
    assert_selector "h1", text: "Checkouts"
  end

  test "creating a Checkout" do
    visit checkouts_url
    click_on "New Checkout"

    fill_in "Address", with: @checkout.address
    fill_in "City", with: @checkout.city
    fill_in "Florist instruction", with: @checkout.florist_instruction
    fill_in "Message", with: @checkout.message
    fill_in "Order", with: @checkout.order_id
    fill_in "Phone", with: @checkout.phone
    fill_in "Recipient name", with: @checkout.recipient_name
    fill_in "Signature", with: @checkout.signature
    click_on "Create Checkout"

    assert_text "Checkout was successfully created"
    click_on "Back"
  end

  test "updating a Checkout" do
    visit checkouts_url
    click_on "Edit", match: :first

    fill_in "Address", with: @checkout.address
    fill_in "City", with: @checkout.city
    fill_in "Florist instruction", with: @checkout.florist_instruction
    fill_in "Message", with: @checkout.message
    fill_in "Order", with: @checkout.order_id
    fill_in "Phone", with: @checkout.phone
    fill_in "Recipient name", with: @checkout.recipient_name
    fill_in "Signature", with: @checkout.signature
    click_on "Update Checkout"

    assert_text "Checkout was successfully updated"
    click_on "Back"
  end

  test "destroying a Checkout" do
    visit checkouts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Checkout was successfully destroyed"
  end
end
