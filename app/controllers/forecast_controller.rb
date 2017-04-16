require 'open-uri'

class ForecastController < ApplicationController
  def coords_to_weather_form
    # Nothing to do here.
    render("forecast/coords_to_weather_form.html.erb")
  end

  def coords_to_weather
    @lat = params[:user_latitude]
    @lng = params[:user_longitude]

    # ==========================================================================
    # Your code goes below.
    # The latitude the user input is in the string @lat.
    # The longitude the user input is in the string @lng.
    # ==========================================================================

    wurl = "https://api.darksky.net/forecast/c2e79377963772be917398a84fdee0b6/#{@lat},#{@lng}"
    parsed_wdata = JSON.parse(open(wurl).read)
    #latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
    #longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

    current_temp = parsed_wdata["currently"]["temperature"]

    @current_temperature = current_temp

    @current_summary = parsed_wdata["currently"]["summary"]

    @summary_of_next_sixty_minutes = parsed_wdata["minutely"]["summary"]

    @summary_of_next_several_hours = parsed_wdata["hourly"]["summary"]

    @summary_of_next_several_days = parsed_wdata["daily"]["summary"]

    render("forecast/coords_to_weather.html.erb")
  end
end
