require 'test_helper'

class QuotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quote = quotes(:one)
  end

  test "should get index" do
    get quotes_url
    assert_response :success
  end

  test "should get new" do
    get new_quote_url
    assert_response :success
  end

  test "should create quote" do
    assert_difference('Quote.count') do
      post quotes_url, params: { quote: { Maximum_Occupants_Per_Floor: @quote.Maximum_Occupants_Per_Floor, Number_Of_Apartments: @quote.Number_Of_Apartments, Number_Of_Basements: @quote.Number_Of_Basements, Number_Of_Companies: @quote.Number_Of_Companies, Number_Of_Elevator_Cages: @quote.Number_Of_Elevator_Cages, Number_Of_Floors: @quote.Number_Of_Floors, Number_Of_Hours_Of_Activity_In_The_Building: @quote.Number_Of_Hours_Of_Activity_In_The_Building, Number_Of_Parking_Spots: @quote.Number_Of_Parking_Spots } }
    end

    assert_redirected_to quote_url(Quote.last)
  end

  test "should show quote" do
    get quote_url(@quote)
    assert_response :success
  end

  test "should get edit" do
    get edit_quote_url(@quote)
    assert_response :success
  end

  test "should update quote" do
    patch quote_url(@quote), params: { quote: { Maximum_Occupants_Per_Floor: @quote.Maximum_Occupants_Per_Floor, Number_Of_Apartments: @quote.Number_Of_Apartments, Number_Of_Basements: @quote.Number_Of_Basements, Number_Of_Companies: @quote.Number_Of_Companies, Number_Of_Elevator_Cages: @quote.Number_Of_Elevator_Cages, Number_Of_Floors: @quote.Number_Of_Floors, Number_Of_Hours_Of_Activity_In_The_Building: @quote.Number_Of_Hours_Of_Activity_In_The_Building, Number_Of_Parking_Spots: @quote.Number_Of_Parking_Spots } }
    assert_redirected_to quote_url(@quote)
  end

  test "should destroy quote" do
    assert_difference('Quote.count', -1) do
      delete quote_url(@quote)
    end

    assert_redirected_to quotes_url
  end
end
