class CreateForecasts < ActiveRecord::Migration[7.1]
  def change
    create_table :forecasts do |t|
      t.integer :zip_code
      t.string :weather
      t.decimal :temp
      t.decimal :temp_feels_like
      t.decimal :temp_min
      t.decimal :temp_max
      t.decimal :pressure
      t.decimal :humidity
      t.decimal :wind_speed
      t.decimal :wind_deg
      t.decimal :wind_gust
      t.string :city
      t.float :coord_lon
      t.float :coord_lat

      t.timestamps
    end
  end
end
