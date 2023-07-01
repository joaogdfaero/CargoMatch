require "application_system_test_case"

class TripsTest < ApplicationSystemTestCase
  setup do
    @trip = trips(:one)
  end

  test "visiting the index" do
    visit trips_url
    assert_selector "h1", text: "Trips"
  end

  test "should create trip" do
    visit trips_url
    click_on "New trip"

    fill_in "Arrival date", with: @trip.arrival_date
    fill_in "Arrival location", with: @trip.arrival_location
    fill_in "Arrival time", with: @trip.arrival_time
    fill_in "Departure date", with: @trip.departure_date
    fill_in "Departure location", with: @trip.departure_location
    fill_in "Departure time", with: @trip.departure_time
    fill_in "Type", with: @trip.type
    fill_in "User", with: @trip.user_id
    click_on "Create Trip"

    assert_text "Trip was successfully created"
    click_on "Back"
  end

  test "should update Trip" do
    visit trip_url(@trip)
    click_on "Edit this trip", match: :first

    fill_in "Arrival date", with: @trip.arrival_date
    fill_in "Arrival location", with: @trip.arrival_location
    fill_in "Arrival time", with: @trip.arrival_time
    fill_in "Departure date", with: @trip.departure_date
    fill_in "Departure location", with: @trip.departure_location
    fill_in "Departure time", with: @trip.departure_time
    fill_in "Type", with: @trip.type
    fill_in "User", with: @trip.user_id
    click_on "Update Trip"

    assert_text "Trip was successfully updated"
    click_on "Back"
  end

  test "should destroy Trip" do
    visit trip_url(@trip)
    click_on "Destroy this trip", match: :first

    assert_text "Trip was successfully destroyed"
  end
end
