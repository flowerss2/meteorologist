require 'open-uri'

class MeteorologistController < ApplicationController
  def street_to_weather_form
    # Nothing to do here.
    render("meteorologist/street_to_weather_form.html.erb")
  end

  def street_to_weather
    @street_address = params[:user_street_address]

    # ==========================================================================
    # Your code goes below.
    #
    # The street address that the user typed is in the variable @street_address.
    # ==========================================================================
    url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{@street_address}"
    parsed_data = JSON.parse(open(url).read)
    latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
    longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]
    @lat = latitude
    @lng = longitude
    wurl = "https://api.darksky.net/forecast/c2e79377963772be917398a84fdee0b6/#{@lat},#{@lng}"
    parsed_wdata = JSON.parse(open(wurl).read)

    @current_temperature = parsed_wdata["currently"]["temperature"]
#current_sum = parsed_wdata[]
@current_summary = parsed_wdata["currently"]["summary"]

@summary_of_next_sixty_minutes = parsed_wdata["minutely"]["summary"]

@summary_of_next_several_hours = parsed_wdata["hourly"]["summary"]

@summary_of_next_several_days = parsed_wdata["daily"]["summary"]

    render("meteorologist/street_to_weather.html.erb")
  end
end
