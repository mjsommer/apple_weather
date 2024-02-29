require "test_helper"

class ForecastsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @forecast = forecasts(:one)
  end

  test "should get index" do
    get forecasts_url
    assert_response :success
  end

  test "should get new" do
    get new_forecast_url
    assert_response :success
  end

  test "should create forecast" do
    assert_difference("Forecast.count") do
      post forecasts_url, params: { forecast: { city: @forecast.city, coord_lat: @forecast.coord_lat, coord_lon: @forecast.coord_lon, humidity: @forecast.humidity, pressure: @forecast.pressure, temp: @forecast.temp, temp_feels_like: @forecast.temp_feels_like, temp_max: @forecast.temp_max, temp_min: @forecast.temp_min, weather: @forecast.weather, wind_deg: @forecast.wind_deg, wind_gust: @forecast.wind_gust, wind_speed: @forecast.wind_speed, zip_code: @forecast.zip_code } }
    end

    assert_redirected_to forecast_url(Forecast.last)
  end

  test "should show forecast" do
    get forecast_url(@forecast)
    assert_response :success
  end

  test "should get edit" do
    get edit_forecast_url(@forecast)
    assert_response :success
  end

  test "should update forecast" do
    patch forecast_url(@forecast), params: { forecast: { city: @forecast.city, coord_lat: @forecast.coord_lat, coord_lon: @forecast.coord_lon, humidity: @forecast.humidity, pressure: @forecast.pressure, temp: @forecast.temp, temp_feels_like: @forecast.temp_feels_like, temp_max: @forecast.temp_max, temp_min: @forecast.temp_min, weather: @forecast.weather, wind_deg: @forecast.wind_deg, wind_gust: @forecast.wind_gust, wind_speed: @forecast.wind_speed, zip_code: @forecast.zip_code } }
    assert_redirected_to forecast_url(@forecast)
  end

  test "should destroy forecast" do
    assert_difference("Forecast.count", -1) do
      delete forecast_url(@forecast)
    end

    assert_redirected_to forecasts_url
  end
end
