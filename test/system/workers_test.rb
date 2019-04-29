require "application_system_test_case"

class WorkersTest < ApplicationSystemTestCase
  setup do
    @worker = workers(:one)
  end

  test "visiting the index" do
    visit workers_url
    assert_selector "h1", text: "Workers"
  end

  test "creating a Worker" do
    visit workers_url
    click_on "New Worker"

    fill_in "Birthday", with: @worker.birthday
    fill_in "Education", with: @worker.education
    fill_in "Fathername", with: @worker.fathername
    fill_in "Firstname", with: @worker.firstname
    fill_in "Lastname", with: @worker.lastname
    fill_in "Lib", with: @worker.lib_id
    fill_in "Position", with: @worker.position
    fill_in "Workdate", with: @worker.workdate
    click_on "Create Worker"

    assert_text "Worker was successfully created"
    click_on "Back"
  end

  test "updating a Worker" do
    visit workers_url
    click_on "Edit", match: :first

    fill_in "Birthday", with: @worker.birthday
    fill_in "Education", with: @worker.education
    fill_in "Fathername", with: @worker.fathername
    fill_in "Firstname", with: @worker.firstname
    fill_in "Lastname", with: @worker.lastname
    fill_in "Lib", with: @worker.lib_id
    fill_in "Position", with: @worker.position
    fill_in "Workdate", with: @worker.workdate
    click_on "Update Worker"

    assert_text "Worker was successfully updated"
    click_on "Back"
  end

  test "destroying a Worker" do
    visit workers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Worker was successfully destroyed"
  end
end
