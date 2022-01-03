require "application_system_test_case"

class ChecklistItemsTest < ApplicationSystemTestCase
  setup do
    @checklist_item = checklist_items(:one)
  end

  test "visiting the index" do
    visit checklist_items_url
    assert_selector "h1", text: "Checklist items"
  end

  test "should create checklist item" do
    visit checklist_items_url
    click_on "New checklist item"

    fill_in "Checklist", with: @checklist_item.checklist_id
    fill_in "Description", with: @checklist_item.description
    check "Is done" if @checklist_item.is_done
    click_on "Create Checklist item"

    assert_text "Checklist item was successfully created"
    click_on "Back"
  end

  test "should update Checklist item" do
    visit checklist_item_url(@checklist_item)
    click_on "Edit this checklist item", match: :first

    fill_in "Checklist", with: @checklist_item.checklist_id
    fill_in "Description", with: @checklist_item.description
    check "Is done" if @checklist_item.is_done
    click_on "Update Checklist item"

    assert_text "Checklist item was successfully updated"
    click_on "Back"
  end

  test "should destroy Checklist item" do
    visit checklist_item_url(@checklist_item)
    click_on "Destroy this checklist item", match: :first

    assert_text "Checklist item was successfully destroyed"
  end
end
