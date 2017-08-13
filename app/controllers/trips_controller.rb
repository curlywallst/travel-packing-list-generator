class TripsController < ApplicationController

  def new
    @trip = Trip.new
    @categories = Category.all
  end

  def create
    @trip = Trip.create(trip_params)
    if params[:trip][:category_id].nil? || params[:trip][:category_id] == ""
      @trip.category = Category.find_or_create_by(name: params[:trip][:categories][:name])
    else
      @trip.category = Category.find(params[:trip][:category_id][0])
    end
    current_user.trips << @trip
    redirect_to trip_path(@trip)
  end

  def edit
    @trip = Trip.find(params[:id])
    @categories = Category.all
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update(trip_params)
    if params[:trip][:item_ids].present? || params[:trip][:items_attributes]
      if params[:trip][:item_ids].present?
        @item = Item.find(params[:trip][:item_ids])
      else
        @item = Item.find_or_create_by(name: params[:trip][:items_attributes].first[1][:name])
        @item.save
      end
      @trip_item = TripItem.new(trip_id: @trip.id, item_id: @item.id, quantity: params[:trip_item][:quantity])
      @trip_item.save
    end
    redirect_to trip_path(@trip)
  end

  def show
    @trip = Trip.find(params[:id])
    @trip_item = TripItem.new
  end


  private

  def trip_params
    params.require(:trip).permit(:title, :destination, :year, :notes, :category_id, item_ids:[], item_attributes: [:name])
  end
end
