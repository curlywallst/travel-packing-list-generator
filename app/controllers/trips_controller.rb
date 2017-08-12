class TripsController < ApplicationController
  def new
    @trip = Trip.new
    @categories = Category.all
  end

  def create
    binding.pry
    @trip = Trip.create(trip_params)
    if params[:trip][:category_id].nil? || params[:trip][:category_id] == ""
      @trip.category = Category.find_or_create_by(name: params[:trip][:categories][:name])
    else
      @trip.category = Category.find(params[:trip][:category_id][0])
    end
    current_user.trips << @trip
    redirect_to trip_path(@trip)
  end

  def show
    @trip = Trip.find(params[:id])
    @item = Item.new
  end


  private

  def trip_params
    params.require(:trip).permit(:title, :destination, :year, :notes, :category, :quantity, item_ids:[], item_attributes: [:name])
  end
end
