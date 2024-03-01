# config/initializers/open-weather-api.rb

OpenWeatherAPI.configure do |config|
  # API key
  config.api_key = "108ea82aa7de13fe38587c05f8baab79"

  # Optionals
  config.default_language = 'en'     # English
  config.default_country_code = 'us' # United States
  config.default_units = 'metric'    # 'metric' by default
end
