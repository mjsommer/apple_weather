require 'rails_helper'

RSpec.describe Forecast, type: :model do
  # Test for the class method 'request_data'
  it 'returns a forecast hash when given a valid zip code' do
    allow(Rails.configuration.open_weather_api).to receive(:current).and_return({
      'weather' => [{'main' => 'Clear'}],
      'main' => {
        'temp' => 20,
        'feels_like' => 19,
        'temp_min' => 18,
        'temp_max' => 22,
        'pressure' => 1013,
        'humidity' => 50
      },
      'wind' => {
        'speed' => 3.6,
        'deg' => 160,
        'gust' => 5.7
      },
      'name' => 'Test City',
      'coord' => {
        'lon' => 139,
        'lat' => 35
      }
    })

    expected_hash = {
      zip_code: '12345',
      weather: 'Clear',
      temp: 20,
      temp_feels_like: 19,
      temp_min: 18,
      temp_max: 22,
      pressure: 1013,
      humidity: 50,
      wind_speed: 3.6,
      wind_deg: 160,
      wind_gust: 5.7,
      city: 'Test City',
      coord_lon: 139,
      coord_lat: 35
    }

    expect(Forecast.request_data('12345')).to eq(expected_hash)
  end

  # Test for the instance method 'stale?'
  describe '#stale?' do
    let(:forecast) { Forecast.create(updated_at: Time.now) }

    it 'returns false when the forecast is updated less than 30 minutes ago' do
      expect(forecast.stale?).to eq(false)
    end

    it 'returns true when the forecast is updated more than 30 minutes ago' do
      forecast.update(updated_at: 31.minutes.ago)
      expect(forecast.stale?).to eq(true)
    end
  end
end
