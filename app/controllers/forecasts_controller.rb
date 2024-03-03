class ForecastsController < ApplicationController
  before_action :set_forecast, only: %i[ show ]

  # GET /forecasts/1 or /forecasts/1.json
  def show
  end

  # GET /forecasts/new
  def new
    @forecast = Forecast.new
  end

  # This method is a combination create/update, as the /new form, is used for both.
  def create
    @forecast = Forecast.find_by(zip_code: forecast_params[:zip_code])

    if @forecast.nil?
      # Create, if the forecast does not exist.
      @forecast = Forecast.new(Forecast.request_data(forecast_params[:zip_code]))

      respond_to do |format|
        if @forecast.save
          format.html { redirect_to forecast_url(@forecast.zip_code)}
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    else
      # Update, if the forecast exists, and is not stale.
      if @forecast.stale? #(forecast_params[:zip_code])
        respond_to do |format|
          if @forecast.update(Forecast.request_data(forecast_params[:zip_code]))
            format.html { redirect_to forecast_url(@forecast.zip_code)}
          else
            format.html { render :edit, status: :unprocessable_entity }
          end
        end
      else
        respond_to do |format|
          format.html { redirect_to forecast_url(@forecast.zip_code), notice: "This forecast was pulled from cache." }
        end
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forecast
      @forecast = Forecast.find_by(zip_code: params[:zip_code])
    end

    # Only allow a list of trusted parameters through.
    def forecast_params
      params.require(:forecast).permit(:zip_code, :weather, :temp, :temp_feels_like, :temp_min, :temp_max, :pressure, :humidity, :wind_speed, :wind_deg, :wind_gust, :city, :coord_lon, :coord_lat)
    end
end
