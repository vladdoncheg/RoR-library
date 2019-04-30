require "application_system_test_case"

class ServsTest < ApplicationSystemTestCase
  setup do
    @serv = servs(:one)
  end

  test "visiting the index" do
    visit servs_url
    assert_selector "h1", text: "Servs"
  end

  test "creating a Serv" do
    visit servs_url
    click_on "New Serv"

    fill_in "Book", with: @serv.book_id
    fill_in "Finish", with: @serv.finish
    fill_in "Reader", with: @serv.reader_id
    fill_in "Start", with: @serv.start
    click_on "Create Serv"

    assert_text "Serv was successfully created"
    click_on "Back"
  end

  test "updating a Serv" do
    visit servs_url
    click_on "Edit", match: :first

    fill_in "Book", with: @serv.book_id
    fill_in "Finish", with: @serv.finish
    fill_in "Reader", with: @serv.reader_id
    fill_in "Start", with: @serv.start
    click_on "Update Serv"

    assert_text "Serv was successfully updated"
    click_on "Back"
  end

  test "destroying a Serv" do
    visit servs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Serv was successfully destroyed"
  end
end
