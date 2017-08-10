class TripsController < ApplicationController
  def new
    @trip = Trip.new
  end

  def create
    binding.pry

  end
end
