require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    @quote = quotes(:one)
  end

  test "visiting the index" do
    visit quotes_url
    assert_selector "h1", text: "Quotes"
  end

  test "creating a Quote" do
    visit quotes_url
    click_on "New Quote"

    fill_in "Maximum occupants per floor", with: @quote.Maximum_Occupants_Per_Floor
    fill_in "Number of apartments", with: @quote.Number_Of_Apartments
    fill_in "Number of basements", with: @quote.Number_Of_Basements
    fill_in "Number of companies", with: @quote.Number_Of_Companies
    fill_in "Number of elevator cages", with: @quote.Number_Of_Elevator_Cages
    fill_in "Number of floors", with: @quote.Number_Of_Floors
    fill_in "Number of hours of activity in the building", with: @quote.Number_Of_Hours_Of_Activity_In_The_Building
    fill_in "Number of parking spots", with: @quote.Number_Of_Parking_Spots
    click_on "Create Quote"

    assert_text "Quote was successfully created"
    click_on "Back"
  end

  test "updating a Quote" do
    visit quotes_url
    click_on "Edit", match: :first

    fill_in "Maximum occupants per floor", with: @quote.Maximum_Occupants_Per_Floor
    fill_in "Number of apartments", with: @quote.Number_Of_Apartments
    fill_in "Number of basements", with: @quote.Number_Of_Basements
    fill_in "Number of companies", with: @quote.Number_Of_Companies
    fill_in "Number of elevator cages", with: @quote.Number_Of_Elevator_Cages
    fill_in "Number of floors", with: @quote.Number_Of_Floors
    fill_in "Number of hours of activity in the building", with: @quote.Number_Of_Hours_Of_Activity_In_The_Building
    fill_in "Number of parking spots", with: @quote.Number_Of_Parking_Spots
    click_on "Update Quote"

    assert_text "Quote was successfully updated"
    click_on "Back"
  end

  test "destroying a Quote" do
    visit quotes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quote was successfully destroyed"
  end
end
