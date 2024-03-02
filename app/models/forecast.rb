class Forecast < ApplicationRecord

  def self.request_data(zip_code)
    owa = Rails.configuration.open_weather_api
    current = owa.current(zipcode: zip_code)

    forecast_hash = {
      zip_code: zip_code,
      weather: current['weather'][0]['main'],
      temp: current['main']['temp'],
      temp_feels_like: current['main']['feels_like'],
      temp_min: current['main']['temp_min'],
      temp_max: current['main']['temp_max'],
      pressure: current['main']['pressure'],
      humidity: current['main']['humidity'],
      wind_speed: current['wind']['speed'],
      wind_deg: current['wind']['deg'],
      wind_gust: current['wind']['gust'],
      city: current['name'],
      coord_lon: current['coord']['lon'],
      coord_lat: current['coord']['lat']
    }
  end

  def stale?(zip_code)
    forecast = Forecast.find_by(zip_code: zip_code)
    forecast.updated_at < 30.minutes.ago
  end

  def refresh(zip_code)
    forecast = Forecast.find_by(zip_code: zip_code)
    forecast.update(Forecast.request_data(zip_code))
  end
end
