json.extract! forecast, :id, :zip_code, :weather, :temp, :temp_feels_like, :temp_min, :temp_max, :pressure, :humidity, :wind_speed, :wind_deg, :wind_gust, :city, :coord_lon, :coord_lat, :created_at, :updated_at
json.url forecast_url(forecast, format: :json)
