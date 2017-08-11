class TripsController < ApplicationController
  def new
    @trip = Trip.new
    @categories = Category.all
  end

  def create
    @trip = Trip.create(trip_params)
    binding.pry
    @trip.category = Category.find_or_create_by(name: params[:trip][:categories][:name])
    current_user.trips << @trip
    redirect_to trip_path(@trip)
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def index
    @trips = current_user.trips.all
  end

  private

  def trip_params
    params.require(:trip).permit(:title, :destination, :year, :notes, :category)
  end
end
