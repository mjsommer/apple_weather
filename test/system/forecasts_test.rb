require "application_system_test_case"

class ForecastsTest < ApplicationSystemTestCase
  setup do
    @forecast = forecasts(:one)
  end

  test "visiting the index" do
    visit forecasts_url
    assert_selector "h1", text: "Forecasts"
  end

  test "should create forecast" do
    visit forecasts_url
    click_on "New forecast"

    fill_in "City", with: @forecast.city
    fill_in "Coord lat", with: @forecast.coord_lat
    fill_in "Coord lon", with: @forecast.coord_lon
    fill_in "Humidity", with: @forecast.humidity
    fill_in "Pressure", with: @forecast.pressure
    fill_in "Temp", with: @forecast.temp
    fill_in "Temp feels like", with: @forecast.temp_feels_like
    fill_in "Temp max", with: @forecast.temp_max
    fill_in "Temp min", with: @forecast.temp_min
    fill_in "Weather", with: @forecast.weather
    fill_in "Wind deg", with: @forecast.wind_deg
    fill_in "Wind gust", with: @forecast.wind_gust
    fill_in "Wind speed", with: @forecast.wind_speed
    fill_in "Zip code", with: @forecast.zip_code
    click_on "Create Forecast"

    assert_text "Forecast was successfully created"
    click_on "Back"
  end

  test "should update Forecast" do
    visit forecast_url(@forecast)
    click_on "Edit this forecast", match: :first

    fill_in "City", with: @forecast.city
    fill_in "Coord lat", with: @forecast.coord_lat
    fill_in "Coord lon", with: @forecast.coord_lon
    fill_in "Humidity", with: @forecast.humidity
    fill_in "Pressure", with: @forecast.pressure
    fill_in "Temp", with: @forecast.temp
    fill_in "Temp feels like", with: @forecast.temp_feels_like
    fill_in "Temp max", with: @forecast.temp_max
    fill_in "Temp min", with: @forecast.temp_min
    fill_in "Weather", with: @forecast.weather
    fill_in "Wind deg", with: @forecast.wind_deg
    fill_in "Wind gust", with: @forecast.wind_gust
    fill_in "Wind speed", with: @forecast.wind_speed
    fill_in "Zip code", with: @forecast.zip_code
    click_on "Update Forecast"

    assert_text "Forecast was successfully updated"
    click_on "Back"
  end

  test "should destroy Forecast" do
    visit forecast_url(@forecast)
    click_on "Destroy this forecast", match: :first

    assert_text "Forecast was successfully destroyed"
  end
end
