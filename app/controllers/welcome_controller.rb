class WelcomeController < ApplicationController

  def home
    @trips = Trip.all
  end

end
