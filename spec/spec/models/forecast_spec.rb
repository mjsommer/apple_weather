require 'rails_helper'

RSpec.describe Forecast, type: :model do
  describe '#stale?' do
    let(:zip_code) { '12345' }

    context 'when forecast is nil' do
      it 'returns true' do
        expect(Forecast.new.stale?(zip_code)).to eq(true)
      end
    end

    context 'when forecast is not nil' do
      let!(:forecast) { Forecast.create(zip_code: zip_code, updated_at: updated_at) }

      context 'when updated_at is older than 30 minutes' do
        let(:updated_at) { 31.minutes.ago }

        it 'returns true' do
          expect(Forecast.new.stale?(zip_code)).to eq(true)
        end
      end

      context 'when updated_at is within the last 30 minutes' do
        let(:updated_at) { 29.minutes.ago }

        it 'returns false' do
          expect(Forecast.new.stale?(zip_code)).to eq(false)
        end
      end
    end
  end
end

RSpec.describe Forecast, type: :model do
  describe '#refresh' do
    let(:zip_code) { '12345' }
    let(:forecast) { Forecast.create(zip_code: zip_code) }
    let(:owa) { instance_double(OpenWeatherAPI::API) }
    let(:current_weather) do
      {
        'weather' => [{'main' => 'Cloudy'}],
        'main' => {'temp' => 20, 'feels_like' => 18, 'temp_min' => 15, 'temp_max' => 25, 'pressure' => 1013, 'humidity' => 82},
        'wind' => {'speed' => 5, 'deg' => 180, 'gust' => 7},
        'name' => 'Test City',
        'coord' => {'lon' => 10, 'lat' => 20}
      }
    end

    before do
      allow(Rails.configuration).to receive(:open_weather_api).and_return(owa)
      allow(owa).to receive(:current).with(zipcode: zip_code).and_return(current_weather)
    end

    it 'updates the forecast with the current weather' do
      forecast.refresh(zip_code)

      expect(forecast.reload.weather).to eq('Cloudy')
      expect(forecast.temp).to eq(20)
      expect(forecast.temp_feels_like).to eq(18)
      expect(forecast.temp_min).to eq(15)
      expect(forecast.temp_max).to eq(25)
      expect(forecast.pressure).to eq(1013)
      expect(forecast.humidity).to eq(82)
      expect(forecast.wind_speed).to eq(5)
      expect(forecast.wind_deg).to eq(180)
      expect(forecast.wind_gust).to eq(7)
      expect(forecast.city).to eq('Test City')
      expect(forecast.coord_lon).to eq(10)
      expect(forecast.coord_lat).to eq(20)
    end
  end
end
