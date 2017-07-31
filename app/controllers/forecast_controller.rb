class ForecastController < ApplicationController

  def view
    unfiltered = EpaApi.new(params[:zipcode]).hourly
    @hourly_data = HourlyData.new(unfiltered).decorate
  end
end
