class TripItemsController < ApplicationController

  def create
    if params[:trip_item][:item_id][0].nil? || params[:trip_item][:item_id][0] == ""
      trip_item = TripItem.create(trip_item_params)
    else
      trip_item = TripItem.create(trip_id: params[:trip_item][:trip_id], item_id: params[:trip_item][:item_id][0], quantity: params[:trip_item][:quantity])
    end
    @trip = Trip.find(trip_item.trip_id)
    redirect_to trip_path(@trip)
  end

  private

  def trip_item_params
    params.require(:trip_item).permit(:trip_id, :item_id, :quantity, item_attributes:[:name])
  end
end
