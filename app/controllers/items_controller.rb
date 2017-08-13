class ItemsController < ApplicationController

  def new
  end

  def create
    binding.pry
  end

  def index
    @trip = Trip.find(params[:trip_id])
    @items = @trip.items
  end

  def edit
    @item = Item.find(params[:id])
    @trip = Trip.find(params[:trip_id])
    @trip_item = @trip.trip_items.find_by(item_id: @item.id)
  end

  def update
    binding.pry
  end

  def destroy
    @item = Item.find(params[:id])
    @trip = Trip.find(params[:trip_id])
    @trip_item = @trip.trip_items.find_by(item_id: @item.id)
    @trip_item.delete
    redirect_to trip_items_path(@trip)
  end

  private

  def item_params
    params.require(:item).permit(:name, :category_id, :description, trip_ids:[], trip_attributes: [:title, :year, :category])
  end
end
