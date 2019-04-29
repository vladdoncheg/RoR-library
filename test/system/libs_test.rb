require "application_system_test_case"

class LibsTest < ApplicationSystemTestCase
  setup do
    @lib = libs(:one)
  end

  test "visiting the index" do
    visit libs_url
    assert_selector "h1", text: "Libs"
  end

  test "creating a Lib" do
    visit libs_url
    click_on "New Lib"

    fill_in "Adress", with: @lib.adress
    fill_in "Name", with: @lib.name
    fill_in "Number", with: @lib.number
    click_on "Create Lib"

    assert_text "Lib was successfully created"
    click_on "Back"
  end

  test "updating a Lib" do
    visit libs_url
    click_on "Edit", match: :first

    fill_in "Adress", with: @lib.adress
    fill_in "Name", with: @lib.name
    fill_in "Number", with: @lib.number
    click_on "Update Lib"

    assert_text "Lib was successfully updated"
    click_on "Back"
  end

  test "destroying a Lib" do
    visit libs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lib was successfully destroyed"
  end
end
