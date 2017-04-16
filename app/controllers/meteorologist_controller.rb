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

    
    @current_temperature = current_temp
#current_sum = parsed_wdata[]
    @current_summary = "Replace this string with your answer."
#next_sixtymin = parsed_wdata[]
    @summary_of_next_sixty_minutes = "Replace this string with your answer."
#next_sevhours = parsed_wdata[]
    @summary_of_next_several_hours = "Replace this string with your answer."
#next_sevdays = parsed_wdata[]
    @summary_of_next_several_days = "Replace this string with your answer."

    render("meteorologist/street_to_weather.html.erb")
  end
end
